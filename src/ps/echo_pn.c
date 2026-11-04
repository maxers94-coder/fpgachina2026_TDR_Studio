#include "echo_pn.h"

int echo_pn_make_template(int16_t *dst, size_t count)
{
    if (!dst || count != 640) return -1;
    for (size_t i = 0; i < count; ++i) dst[i] = 0;
    uint8_t state = 0x7fu;
    for (size_t chip = 0; chip < 127; ++chip) {
        int16_t value = (state & 0x40u) ? 16384 : -16384;
        for (size_t repeat = 0; repeat < 4; ++repeat)
            dst[128 + chip * 4 + repeat] = value;
        uint8_t feedback = (uint8_t)(((state >> 6) ^ (state >> 5)) & 1u);
        state = (uint8_t)(((state << 1) & 0x7fu) | feedback);
    }
    return state == 0x7fu ? 0 : -2;
}
