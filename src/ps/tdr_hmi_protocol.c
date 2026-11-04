#include "tdr_hmi_protocol.h"

#include <stdio.h>
#include <string.h>

static void drop(tdr_hmi_parser_t *p, size_t n)
{
    if (n >= p->len) { p->len = 0; return; }
    memmove(p->buf, p->buf + n, p->len - n);
    p->len -= n;
}

static int valid_request(uint8_t cmd, uint16_t arg)
{
    switch (cmd) {
        case 0x01: return arg <= 3u;
        case 0x10: case 0x11: case 0x12: case 0x20: return arg == 0u;
        case 0x30: return arg <= 2u;
        case 0x31: return arg <= 1u;
        case 0x40: return arg == 5u || arg == 6u || arg == 7u;
        case 0x41: return arg == 4u || arg == 8u;
        case 0x42: return arg == 1u || arg == 32u;
        default: return 0;
    }
}

void tdr_hmi_parser_init(tdr_hmi_parser_t *p)
{
    if (p) memset(p, 0, sizeof(*p));
}

int tdr_hmi_parser_feed(tdr_hmi_parser_t *p, uint8_t byte,
                        uint32_t now_ms, tdr_hmi_event_t *ev)
{
    if (!p || !ev) return 0;
    memset(ev, 0, sizeof(*ev));
    if (p->have_time && p->len &&
        (uint32_t)(now_ms - p->last_ms) > TDR_HMI_PARTIAL_TIMEOUT_MS)
        p->len = 0;
    p->have_time = 1;
    p->last_ms = now_ms;
    if (p->len == TDR_HMI_RX_CAPACITY) drop(p, 1);
    p->buf[p->len++] = byte;

    while (p->len) {
        uint8_t first = p->buf[0];
        size_t expected = 0;
        if (first == 0xA5u) {
            if (p->len < 2u) return 0;
            if (p->buf[1] != 0x5Au) { drop(p, 1); continue; }
            if (p->len < 8u) return 0;
            if (p->buf[2] == 0x01u && p->buf[6] == 0x0Du &&
                p->buf[7] == 0x0Au) {
                uint16_t arg = (uint16_t)(p->buf[4] | ((uint16_t)p->buf[5] << 8));
                if (valid_request(p->buf[3], arg)) {
                    ev->type = TDR_HMI_REQUEST;
                    ev->cmd = p->buf[3];
                    ev->arg = arg;
                    drop(p, 8);
                    return 1;
                }
            }
            drop(p, 1); /* Invalid request: seek next sync marker. */
            continue;
        }
        if (first == 0x65u) expected = 7u;
        else if (first == 0x66u) expected = 5u;
        else if (first == 0x67u || first == 0x68u) expected = 9u;
        else if (first == 0x71u) expected = 8u;
        else if (first == 0x70u) {
            /* Native variable-length text response, consume through FF FF FF. */
            if (p->len >= 4u && p->buf[p->len-1] == 0xFFu &&
                p->buf[p->len-2] == 0xFFu && p->buf[p->len-3] == 0xFFu) {
                ev->type = TDR_HMI_OTHER;
                ev->code = first;
                p->len = 0;
                return 1;
            }
            return 0;
        } else if (first == 0x00u || first == 0x01u ||
                   (first >= 0x02u && first <= 0x24u) ||
                   first == 0x88u || first == 0xFEu || first == 0xFDu) {
            expected = 4u;
        } else {
            drop(p, 1);
            continue;
        }
        if (p->len < expected) return 0;
        if (p->buf[expected-3] != 0xFFu || p->buf[expected-2] != 0xFFu ||
            p->buf[expected-1] != 0xFFu) {
            drop(p, 1);
            continue;
        }
        ev->code = first;
        if (first == 0x01u) ev->type = TDR_HMI_ACK;
        else if (first == 0x65u) {
            ev->type = TDR_HMI_TOUCH;
            ev->page = p->buf[1];
            ev->component = p->buf[2];
            ev->pressed = p->buf[3];
        } else if (first == 0x66u) {
            ev->type = TDR_HMI_PAGE;
            ev->page = p->buf[1];
        } else if (first == 0xFEu) ev->type = TDR_HMI_BULK_READY;
        else if (first == 0xFDu) ev->type = TDR_HMI_BULK_DONE;
        else if (first == 0x88u) ev->type = TDR_HMI_READY;
        else if (first == 0x67u || first == 0x68u || first == 0x71u)
            ev->type = TDR_HMI_OTHER;
        else ev->type = TDR_HMI_ERROR;
        drop(p, expected);
        return 1;
    }
    return 0;
}

static size_t finish_ascii(uint8_t *out, size_t cap, int body_len)
{
    if (body_len < 0 || (size_t)body_len + 3u > cap) return 0;
    out[body_len] = 0xFFu;
    out[body_len+1] = 0xFFu;
    out[body_len+2] = 0xFFu;
    return (size_t)body_len + 3u;
}

size_t tdr_hmi_make_text(uint8_t *out, size_t cap,
                         const char *control, const char *text)
{
    size_t i;
    int n;
    if (!out || !control || !text || cap < 4u) return 0;
    if (!control[0]) return 0;
    for (i = 0; control[i]; ++i) {
        char c = control[i];
        if (i > 28 || !((c >= 'A' && c <= 'Z') ||
                        (c >= 'a' && c <= 'z') ||
                        (c >= '0' && c <= '9') || c == '_')) return 0;
    }
    for (i = 0; text[i]; ++i) {
        unsigned char c = (unsigned char)text[i];
        if (c < 0x20u || c > 0x7Eu || c == '"' || c == '\\') return 0;
    }
    n = snprintf((char *)out, cap - 3u, "%s.txt=\"%s\"", control, text);
    if (n < 0 || (size_t)n >= cap - 3u) return 0;
    return finish_ascii(out, cap, n);
}

size_t tdr_hmi_make_clear(uint8_t *out, size_t cap,
                          unsigned id, unsigned channel)
{
    int n;
    if (!out || cap < 4u || id > 255u || channel > 3u) return 0;
    n = snprintf((char *)out, cap - 3u, "cle %u,%u", id, channel);
    if (n < 0 || (size_t)n >= cap - 3u) return 0;
    return finish_ascii(out, cap, n);
}

size_t tdr_hmi_make_add(uint8_t *out, size_t cap,
                        unsigned id, unsigned channel, unsigned value)
{
    int n;
    if (!out || cap < 4u || id > 255u || channel > 3u || value > 255u)
        return 0;
    n = snprintf((char *)out, cap - 3u, "add %u,%u,%u", id, channel, value);
    if (n < 0 || (size_t)n >= cap - 3u) return 0;
    return finish_ascii(out, cap, n);
}

size_t tdr_hmi_make_addt(uint8_t *out, size_t cap,
                         unsigned id, unsigned channel, unsigned count)
{
    if (!out || cap<4u || id>255u || channel>3u || count==0u || count>768u) return 0;
    int n=snprintf((char *)out,cap-3u,"addt %u,%u,%u",id,channel,count);
    if (n<0 || (size_t)n>=cap-3u) return 0;
    return finish_ascii(out,cap,n);
}
