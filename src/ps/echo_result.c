#include <stddef.h>
#include <stdint.h>

#include "echo_result.h"

static uint64_t abs_signed64(int64_t x)
{
    if (x >= 0)
        return (uint64_t)x;

    /* Negating INT64_MIN directly would overflow. */
    return (uint64_t)(-(x + INT64_C(1))) + UINT64_C(1);
}

int echo_find_peak(const int64_t *corr_q16, size_t count,
                   size_t begin, size_t end,
                   uint64_t threshold_q16, echo_peak_t *out)
{
    if (corr_q16 == NULL || out == NULL ||
        count == 0u || begin >= end || end > count)
        return -1;

    /* Ensure callers cannot accidentally use a previous peak. */
    *out = (echo_peak_t){0};

    size_t best_index = begin;
    uint64_t best_abs = 0u;

    for (size_t i = begin; i < end; ++i) {
        uint64_t magnitude = abs_signed64(corr_q16[i]);
        if (magnitude > best_abs) {  /* Ties: earliest sample wins */
            best_abs = magnitude;
            best_index = i;
        }
    }

    if (best_abs <= threshold_q16)
        return 1;

    out->index = best_index;
    out->value_q16 = corr_q16[best_index];
    out->abs_q16 = best_abs;
    out->polarity = (out->value_q16 > 0) ? 1 : -1;

    return 0;
}
