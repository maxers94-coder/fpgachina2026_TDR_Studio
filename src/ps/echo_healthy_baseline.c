#include "echo_healthy_baseline.h"

#include <string.h>

static uint32_t crc_byte(uint32_t crc, uint8_t value)
{
    crc ^= (uint32_t)value;
    for (unsigned bit = 0u; bit < 8u; ++bit)
        crc = (crc & 1u) ? (crc >> 1) ^ UINT32_C(0xEDB88320) : crc >> 1;
    return crc;
}

void echo_healthy_baseline_reset(echo_healthy_baseline_t *ctx)
{
    if (ctx != NULL)
        memset(ctx, 0, sizeof(*ctx));
}

void echo_healthy_baseline_abort(echo_healthy_baseline_t *ctx)
{
    if (ctx == NULL)
        return;
    ctx->count = 0u;
    ctx->last_sequence = 0u;
    ctx->candidate_crc = 0u;
    ctx->collecting = 0u;
    ctx->ready = 0u;
}

int echo_healthy_baseline_begin(echo_healthy_baseline_t *ctx)
{
    if (ctx == NULL)
        return ECHO_HEALTHY_BASELINE_ARGUMENT;
    echo_healthy_baseline_abort(ctx);
    memset(ctx->candidate_sum_q2, 0, sizeof(ctx->candidate_sum_q2));
    ctx->collecting = 1u;
    return ECHO_HEALTHY_BASELINE_OK;
}

int echo_healthy_baseline_add_frame(echo_healthy_baseline_t *ctx,
                                   const int16_t *raw_q2, size_t count,
                                   uint32_t sequence)
{
    if (ctx == NULL || raw_q2 == NULL || count != ECHO_HEALTHY_BASELINE_WORDS)
        return ECHO_HEALTHY_BASELINE_ARGUMENT;
    if (!ctx->collecting || ctx->ready || ctx->count >= ECHO_HEALTHY_BASELINE_FRAMES)
        return ECHO_HEALTHY_BASELINE_STATE;
    if (ctx->count != 0u && sequence != (uint32_t)(ctx->last_sequence + 1u))
        return ECHO_HEALTHY_BASELINE_SEQUENCE;

    /* Three signed int16 frames sum into [-98304, 98301], safely in int32. */
    for (size_t i = 0u; i < ECHO_HEALTHY_BASELINE_WORDS; ++i)
        ctx->candidate_sum_q2[i] += (int32_t)raw_q2[i];
    ctx->last_sequence = sequence;
    ++ctx->count;
    return ECHO_HEALTHY_BASELINE_OK;
}

int echo_healthy_baseline_prepare(echo_healthy_baseline_t *ctx)
{
    if (ctx == NULL)
        return ECHO_HEALTHY_BASELINE_ARGUMENT;
    if (!ctx->collecting || ctx->ready || ctx->count != ECHO_HEALTHY_BASELINE_FRAMES)
        return ECHO_HEALTHY_BASELINE_STATE;
    uint32_t crc = UINT32_C(0xFFFFFFFF);
    for (size_t i = 0u; i < ECHO_HEALTHY_BASELINE_WORDS; ++i) {
        int32_t sum = ctx->candidate_sum_q2[i];
        int32_t rounded = sum >= 0 ? (sum + 1) / 3 : -((-sum + 1) / 3);
        ctx->candidate_q2[i] = (int16_t)rounded;
        uint16_t word = (uint16_t)ctx->candidate_q2[i];
        crc = crc_byte(crc, (uint8_t)(word & 0xffu));
        crc = crc_byte(crc, (uint8_t)(word >> 8));
    }
    ctx->candidate_crc = ~crc;
    ctx->collecting = 0u;
    ctx->ready = 1u;
    return ECHO_HEALTHY_BASELINE_OK;
}

int echo_healthy_baseline_publish(echo_healthy_baseline_t *ctx,
                                 uint32_t verified_crc32)
{
    if (ctx == NULL)
        return ECHO_HEALTHY_BASELINE_ARGUMENT;
    if (!ctx->ready || ctx->collecting || ctx->count != ECHO_HEALTHY_BASELINE_FRAMES)
        return ECHO_HEALTHY_BASELINE_STATE;
    if (verified_crc32 != ctx->candidate_crc)
        return ECHO_HEALTHY_BASELINE_CRC;
    if (ctx->generation == UINT32_MAX)
        return ECHO_HEALTHY_BASELINE_ID_EXHAUSTED;
    memcpy(ctx->active_q2, ctx->candidate_q2, sizeof(ctx->active_q2));
    ctx->active_crc = ctx->candidate_crc;
    ++ctx->generation;
    ctx->active_valid = 1u;
    echo_healthy_baseline_abort(ctx);
    return ECHO_HEALTHY_BASELINE_OK;
}

const int16_t *echo_healthy_baseline_candidate_data(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->ready ? ctx->candidate_q2 : NULL;
}

const int16_t *echo_healthy_baseline_active_data(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->active_valid ? ctx->active_q2 : NULL;
}

uint32_t echo_healthy_baseline_candidate_count(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL ? ctx->count : 0u;
}

uint32_t echo_healthy_baseline_candidate_crc32(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->ready ? ctx->candidate_crc : 0u;
}

uint32_t echo_healthy_baseline_active_crc32(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->active_valid ? ctx->active_crc : 0u;
}

uint32_t echo_healthy_baseline_id(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->active_valid ? ctx->generation : 0u;
}

int echo_healthy_baseline_is_valid(const echo_healthy_baseline_t *ctx)
{
    return ctx != NULL && ctx->active_valid != 0u;
}
