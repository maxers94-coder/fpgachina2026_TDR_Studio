#ifndef TDR_HMI_PROTOCOL_H
#define TDR_HMI_PROTOCOL_H

#include <stddef.h>
#include <stdint.h>

/* TJC8048X270_011, UART 115200 8N1. Platform-independent protocol layer. */
#define TDR_HMI_RX_CAPACITY 64u
#define TDR_HMI_PARTIAL_TIMEOUT_MS 100u

typedef enum {
    TDR_HMI_NONE = 0,
    TDR_HMI_REQUEST,        /* A5 5A 01 CMD ARG_L ARG_H 0D 0A */
    TDR_HMI_ACK,            /* 01 FF FF FF */
    TDR_HMI_ERROR,          /* Native HMI error response */
    TDR_HMI_TOUCH,          /* 65 page component press FF FF FF */
    TDR_HMI_PAGE,           /* 66 page FF FF FF */
    TDR_HMI_BULK_READY,     /* FE FF FF FF */
    TDR_HMI_BULK_DONE,      /* FD FF FF FF */
    TDR_HMI_READY,          /* 88 FF FF FF */
    TDR_HMI_OTHER          /* Other native response */
} tdr_hmi_event_type_t;

typedef struct {
    tdr_hmi_event_type_t type;
    uint8_t cmd;
    uint16_t arg;
    uint8_t code;
    uint8_t page;
    uint8_t component;
    uint8_t pressed;
} tdr_hmi_event_t;

typedef struct {
    uint8_t buf[TDR_HMI_RX_CAPACITY];
    size_t len;
    uint32_t last_ms;
    int have_time;
} tdr_hmi_parser_t;

void tdr_hmi_parser_init(tdr_hmi_parser_t *parser);
/* Call for every UART RX byte. Return 1 when an event is emitted, 0 otherwise.
   Native ACK is never a measurement-complete event. */
int tdr_hmi_parser_feed(tdr_hmi_parser_t *parser, uint8_t byte,
                        uint32_t now_ms, tdr_hmi_event_t *event);
/* Construct one ASCII command INCLUDING 3 raw FF terminators.
   Return bytes produced, or 0 when invalid/insufficient output buffer. */
size_t tdr_hmi_make_text(uint8_t *out, size_t cap,
                         const char *control, const char *ascii_text);
size_t tdr_hmi_make_clear(uint8_t *out, size_t cap,
                          unsigned component_id, unsigned channel);
size_t tdr_hmi_make_add(uint8_t *out, size_t cap,
                        unsigned component_id, unsigned channel, unsigned value);
size_t tdr_hmi_make_addt(uint8_t *out, size_t cap,
                         unsigned component_id, unsigned channel, unsigned count);

#endif
