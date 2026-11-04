#ifndef ECHO_HMI_WAVE_H
#define ECHO_HMI_WAVE_H
#include <stddef.h>
#include <stdint.h>

enum { ECHO_HMI_AVG32=0, ECHO_HMI_DIFFERENCE=1, ECHO_HMI_CORRELATION=2 };
enum { ECHO_HMI_WAVE_MAX=768 };
/* A drawing copy only. All arithmetic/acquisition buffers remain unchanged. */
typedef struct {
    uint8_t pixels[ECHO_HMI_WAVE_MAX];
    unsigned count, component, x, y, width, height, zero;
    unsigned kind, first, source_count, envelope;
    int64_t full_scale; /* Q2 for AVG/DIFF, Q16 for CORR. */
} echo_hmi_wave_t;

/* AVG32 uses raw. DIFF/CORR require the baseline used by the cached D frame.
 * DIFF and CORR remove the same samples0..127 DC change, for display only.
 * page=0/1 matches the delivered English v4/v5 native control IDs/geometry.
 * waveform=0 Mode5, 1 PN, 2 zero DAC, 3 healthy PN difference. */
int echo_hmi_wave_build(const int16_t *raw, const int16_t *baseline,
                       const int64_t *correlation, unsigned waveform,
                       unsigned kind, unsigned zoom, unsigned page,
                       echo_hmi_wave_t *out);
#endif
