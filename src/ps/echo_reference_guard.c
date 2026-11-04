#include "echo_reference_guard.h"
#include "echo_reference_guard_data.h"

#include <string.h>

static uint32_t crc_byte(uint32_t crc, uint8_t value)
{
    crc^=value;
    for (unsigned bit=0u;bit<8u;++bit)
        crc=(crc&1u) ? (crc>>1)^UINT32_C(0xedb88320) : crc>>1;
    return crc;
}

static uint32_t crc_u32_le(uint32_t crc, uint32_t value)
{
    for (unsigned byte=0u;byte<4u;++byte)
        crc=crc_byte(crc,(uint8_t)(value>>(8u*byte)));
    return crc;
}

uint32_t echo_reference_guard_data_crc32(void)
{
    uint32_t crc=UINT32_MAX;
    for (unsigned profile=0u;profile<ECHO_REFERENCE_GUARD_PROFILE_COUNT;++profile) {
        crc=crc_u32_le(crc,ECHO_REFERENCE_GUARD_REF_COUNT);
        crc=crc_u32_le(crc,(uint32_t)reference_guard_pretrigger_sum[profile]);
        for (unsigned i=0u;i<ECHO_REFERENCE_GUARD_CORR_COUNT;++i) {
            uint64_t value=(uint64_t)reference_guard_correlation_sum[profile][i];
            for (unsigned byte=0u;byte<8u;++byte)
                crc=crc_byte(crc,(uint8_t)(value>>(8u*byte)));
        }
    }
    return ~crc;
}

int echo_reference_guard_evaluate(const int16_t *raw, size_t raw_count,
                                  const int64_t *corr, size_t corr_count,
                                  echo_reference_guard_result_t *result)
{
    if (result==NULL) return -1;
    memset(result,0,sizeof(*result));
    if (raw==NULL || corr==NULL || raw_count!=ECHO_REFERENCE_GUARD_RAW_COUNT ||
        corr_count!=ECHO_REFERENCE_GUARD_CORR_COUNT) return -1;

    /* Same hardware product bound as the unchanged legacy PN evaluator.
     * It leaves ample signed64 headroom for the exact 3*128 numerator. */
    const int64_t limit=INT64_C(640)*65535*32768;
    for (unsigned i=0u;i<ECHO_REFERENCE_GUARD_CORR_COUNT;++i)
        if (corr[i]<-limit || corr[i]>limit) return -2;
    if (echo_reference_guard_data_crc32()!=ECHO_REFERENCE_GUARD_EXPECTED_BANK_CRC32)
        return -3;

    int64_t raw_pre_sum=0;
    for (unsigned i=0u;i<ECHO_REFERENCE_GUARD_PRE_COUNT;++i) raw_pre_sum+=raw[i];
    const uint64_t gate_numerator=ECHO_REFERENCE_GUARD_GATE_Q16*
                                 ECHO_REFERENCE_GUARD_DENOMINATOR;
    for (unsigned profile=0u;profile<ECHO_REFERENCE_GUARD_PROFILE_COUNT;++profile) {
        int64_t dc_numerator=(int64_t)ECHO_REFERENCE_GUARD_REF_COUNT*raw_pre_sum-
                             reference_guard_pretrigger_sum[profile];
        uint64_t peak=0u;
        for (unsigned i=0u;i<ECHO_REFERENCE_GUARD_CORR_COUNT;++i) {
            int64_t difference=((int64_t)ECHO_REFERENCE_GUARD_REF_COUNT*corr[i]-
                reference_guard_correlation_sum[profile][i])*
                ECHO_REFERENCE_GUARD_PRE_COUNT-dc_numerator*INT64_C(65536);
            uint64_t word=(uint64_t)difference;
            uint64_t magnitude=difference<0 ? UINT64_C(0)-word : word;
            if (magnitude>peak) peak=magnitude;
        }
        result->peak_numerator[profile]=peak;
        if (peak<gate_numerator) result->matched_mask|=UINT32_C(1)<<profile;
    }
    return 0;
}
