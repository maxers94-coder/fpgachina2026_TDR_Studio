#ifndef MULTIRETURN_CANDIDATE1_H
#define MULTIRETURN_CANDIDATE1_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
enum {MULTI1_MAX=8,MULTI1_MIN_SEPARATION=4};
typedef struct {int lag,sign;int64_t num;} multi1_peak;
typedef struct {bool valid_input,overflow,edge_above_gate;unsigned count;multi1_peak peaks[MULTI1_MAX];} multi1_result;
/* Development diagnostic candidates only. No physical length/type input.
 * Not linked to production FW56; does not establish a fault count/distance. */
void multi1_evaluate(const int64_t *corr,size_t count,int64_t dc_sum,multi1_result *out);
#endif
