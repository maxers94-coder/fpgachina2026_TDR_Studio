#ifndef ECHO_PN_H
#define ECHO_PN_H
#include <stdint.h>
#include <stddef.h>
/* Diagnostic digital template, NOT a measured analog/healthy reference.
 * 128 leading zero samples + 127 chips * 4 ADC samples/chip + 4 zeros.
 * s=0x7f; emit s[6]; s=((s<<1)&0x7f)|((s>>6)^(s>>5))&1.
 */
int echo_pn_make_template(int16_t *dst, size_t count);
#endif
