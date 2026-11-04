#ifndef ECHO_RESULT_H
#define ECHO_RESULT_H

#include <stddef.h>
#include <stdint.h>

/* Peak picked from a signed Q16 correlation array. */
typedef struct {
    size_t index;          /* Index within the supplied correlation array */
    int64_t value_q16;     /* Signed raw correlation value */
    uint64_t abs_q16;      /* Exact absolute value, including INT64_MIN */
    int polarity;          /* +1 positive, -1 negative; not yet RF polarity */
} echo_peak_t;

/*
 * Find the first maximum-absolute-value peak in [begin, end).
 * A peak is accepted only when abs(value) > threshold_q16.
 *
 * Returns:
 *   0 : a peak was found
 *   1 : no point exceeds the threshold
 *  -1 : invalid arguments or search window
 *
 * The physical distance and reflection polarity require calibration.
 */
int echo_find_peak(const int64_t *corr_q16, size_t count,
                   size_t begin, size_t end,
                   uint64_t threshold_q16, echo_peak_t *out);

#endif /* ECHO_RESULT_H */
