#ifndef ECHO_REFERENCE_GUARD_H
#define ECHO_REFERENCE_GUARD_H

#include <stddef.h>
#include <stdint.h>

/* Diagnostic compatibility with two explicitly acquired Normal references.
 * This is not a weak-fault/health classifier and does not calibrate distance. */
#define ECHO_REFERENCE_GUARD_PROFILE_COUNT 2u
#define ECHO_REFERENCE_GUARD_REF_COUNT 3u
#define ECHO_REFERENCE_GUARD_PRE_COUNT 128u
#define ECHO_REFERENCE_GUARD_RAW_COUNT 1024u
#define ECHO_REFERENCE_GUARD_CORR_COUNT 256u
#define ECHO_REFERENCE_GUARD_DENOMINATOR 384u
#define ECHO_REFERENCE_GUARD_GATE_Q16 UINT64_C(208916480)

typedef struct {
    uint32_t matched_mask; /* bit0=original 1m Normal; bit1=2026-10-30 5m Normal */
    uint64_t peak_numerator[ECHO_REFERENCE_GUARD_PROFILE_COUNT];
} echo_reference_guard_result_t;

/* 0: evaluated, including matched_mask==0 (unknown/incompatible).
 * -1: bad arguments/counts; -2: impossible correlation magnitude;
 * -3: frozen reference bank CRC mismatch. On error result is cleared.
 * A bit is set only when max(abs(DC128-removed difference numerator)) is
 * strictly below GATE_Q16*384. Equality is rejected, as in the original gate.
 * The caller must intersect masks over all three B sources before publishing.
 * No alignment, gain fit, reference update, or hardware access occurs here. */
int echo_reference_guard_evaluate(const int16_t *raw, size_t raw_count,
                                  const int64_t *corr, size_t corr_count,
                                  echo_reference_guard_result_t *result);

/* CRC32/ISO-HDLC over profile1 then profile2, each encoded as:
 * u32le(reference_count), s32le(pretrigger_sum), 256*s64le(corr_sum).
 * Exactly 4112 bytes, no host padding or native-endian serialization. */
uint32_t echo_reference_guard_data_crc32(void);

#endif
