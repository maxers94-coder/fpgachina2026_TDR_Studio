#ifndef ECHO_HEALTHY_BASELINE_H
#define ECHO_HEALTHY_BASELINE_H

#include <stddef.h>
#include <stdint.h>

#define ECHO_HEALTHY_BASELINE_WORDS 1024u
#define ECHO_HEALTHY_BASELINE_FRAMES 3u

/* Keep this object in static/global storage: it owns approximately 8 KiB.
 * Candidate preparation never modifies the last explicitly published baseline.
 * The caller publishes only after PL load, CRC verification and commit succeed.
 * A reset deliberately invalidates the active baseline; nothing is persisted.
 */
typedef struct {
    int32_t candidate_sum_q2[ECHO_HEALTHY_BASELINE_WORDS];
    int16_t candidate_q2[ECHO_HEALTHY_BASELINE_WORDS];
    int16_t active_q2[ECHO_HEALTHY_BASELINE_WORDS];
    uint32_t count;
    uint32_t last_sequence;
    uint32_t candidate_crc;
    uint32_t active_crc;
    uint32_t generation;
    unsigned collecting;
    unsigned ready;
    unsigned active_valid;
} echo_healthy_baseline_t;

enum {
    ECHO_HEALTHY_BASELINE_OK = 0,
    ECHO_HEALTHY_BASELINE_ARGUMENT = -1,
    ECHO_HEALTHY_BASELINE_STATE = -2,
    ECHO_HEALTHY_BASELINE_SEQUENCE = -3,
    ECHO_HEALTHY_BASELINE_CRC = -4,
    ECHO_HEALTHY_BASELINE_ID_EXHAUSTED = -5
};

void echo_healthy_baseline_reset(echo_healthy_baseline_t *ctx);
int echo_healthy_baseline_begin(echo_healthy_baseline_t *ctx);
int echo_healthy_baseline_add_frame(echo_healthy_baseline_t *ctx,
                                   const int16_t *raw_q2, size_t count,
                                   uint32_t sequence);
/* Round the signed three-frame mean to the nearest integer Q2 symmetrically.
 * Division by three has no exact half ties. CRC32/ISO-HDLC covers each int16
 * little-endian word (low byte first), with initial/final XOR 0xffffffff.
 */
int echo_healthy_baseline_prepare(echo_healthy_baseline_t *ctx);
int echo_healthy_baseline_publish(echo_healthy_baseline_t *ctx,
                                 uint32_t verified_crc32);
/* Cancel only candidate state. The active data, ID and CRC remain unchanged. */
void echo_healthy_baseline_abort(echo_healthy_baseline_t *ctx);

const int16_t *echo_healthy_baseline_candidate_data(const echo_healthy_baseline_t *ctx);
const int16_t *echo_healthy_baseline_active_data(const echo_healthy_baseline_t *ctx);
uint32_t echo_healthy_baseline_candidate_count(const echo_healthy_baseline_t *ctx);
uint32_t echo_healthy_baseline_candidate_crc32(const echo_healthy_baseline_t *ctx);
uint32_t echo_healthy_baseline_active_crc32(const echo_healthy_baseline_t *ctx);
uint32_t echo_healthy_baseline_id(const echo_healthy_baseline_t *ctx);
int echo_healthy_baseline_is_valid(const echo_healthy_baseline_t *ctx);

#endif
