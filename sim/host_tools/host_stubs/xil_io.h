#ifndef HOST_XIL_IO_H
#define HOST_XIL_IO_H
#include <stdint.h>
typedef uintptr_t UINTPTR;
uint32_t Xil_In32(UINTPTR);
void Xil_Out32(UINTPTR, uint32_t);
#endif
