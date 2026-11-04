#ifndef ECHO_PL_H
#define ECHO_PL_H

#include <stddef.h>
#include <stdint.h>

#define ECHO_RESULT_COUNT 256u

/* One coherent driver observation. LAST_ERROR is the PL's sticky error code,
 * read alongside STATUS to let every caller reject a failed acquisition. */
struct echo_status {
    uint32_t raw;
    uint32_t last_error;
};

/* Initialization */
int echo_init(uintptr_t base);

/* Control and status */
int echo_get_status(struct echo_status *status);
int echo_start(void);
int echo_clear_status(void);
/* Mode 2 sends zero with markers for baseline; 5/6/7 send test pulses.
 * Width 1..32 DCO pairs; mode 7 requires even width. */
int echo_configure_pulse(uint8_t mode, uint8_t width);
/* 0=legacy waveform, 1=fixed PN127/50Mchip diagnostic. Old v3.1 accepts only 0. */
int echo_configure_waveform(int pn_enable);
int echo_get_frame_count(uint32_t *count);
/* Check that each START completes a genuinely NEW transaction. */
int echo_get_transaction_count(uint32_t *count);
/* Read the entire signed Q2 average frame after a completed transaction. */
int echo_read_average_frame(int16_t *dst, size_t capacity);

/* Coefficients */
int echo_load_baseline(const int16_t *data, size_t count);
int echo_load_template(const int16_t *data, size_t count);
int echo_commit_coefficients(void);

/* Results: 0 on success; discard dst on any error. */
int echo_read_results(int64_t *dst, size_t capacity);

#endif /* ECHO_PL_H */
