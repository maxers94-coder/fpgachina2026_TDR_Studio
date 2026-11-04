#ifndef RETURN_CANDIDATE1_H
#define RETURN_CANDIDATE1_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/* Host-development copy; not linked into the deployed FW44 application.
 * Caller validates the coherent RAW, baseline CRC, idle/nonclipped PL status,
 * 200MSPS PN127/50Mchip/s amplitude4096/AVG32 and frozen reference context.
 * OPEN_LIKE / SHORT_LIKE are diagnostic consistency labels, not unique circuit
 * identification or calibrated impedance. No known length or sign is accepted.
 */
typedef enum return_candidate1_status {
    RETURN1_INVALID_INPUT=0, RETURN1_REFERENCE_UNFITTED=1,
    RETURN1_LOW_RETURN=2, RETURN1_EDGE_PEAK=3, RETURN1_OUTSIDE_FIT_SPAN=4,
    RETURN1_POSITIVE_RETURN=5, RETURN1_NEGATIVE_RETURN=6,
    RETURN1_AMBIGUOUS_RETURN=7, RETURN1_OPEN_LIKE=8, RETURN1_SHORT_LIKE=9
} return_candidate1_status;
typedef struct return_candidate1_result {
    return_candidate1_status status;
    int lag;
    int sign;
    int64_t peak_num;
    uint64_t abs_peak_num;
    uint64_t other_abs_num;
    bool label_available;
    bool fault_type_valid; /* Always false in this development candidate. */
} return_candidate1_result;

/* Exactly256 signed48 correlations. N[k]=128*corr[k]-dc_sum*65536.
 * Global absolute maximum, lowest-lag tie. No input mutation or allocation.
 * Invalid arguments reset a non-NULL output, including lag=-1; NULL output
 * returns INVALID_INPUT without dereference. Integer operations fit in int64.
 */
return_candidate1_status return_candidate1_evaluate(const int64_t *corr,
    size_t count,int64_t dc_sum,int profile,int mask,return_candidate1_result *out);
#endif
