#ifndef HOST_XUARTPS_H
#define HOST_XUARTPS_H
#include <stdint.h>
typedef uint8_t u8;
typedef uint32_t u32;
typedef struct { uintptr_t BaseAddress; } XUartPs_Config;
typedef struct { uintptr_t BaseAddress; } XUartPs;
typedef struct { unsigned BaudRate, DataBits, Parity, StopBits; } XUartPsFormat;
#define XUARTPS_FORMAT_8_BITS 8u
#define XUARTPS_FORMAT_NO_PARITY 0u
#define XUARTPS_FORMAT_1_STOP_BIT 1u
#define XUARTPS_OPER_MODE_NORMAL 0u
XUartPs_Config *XUartPs_LookupConfig(unsigned id);
int XUartPs_CfgInitialize(XUartPs *, XUartPs_Config *, uintptr_t);
int XUartPs_SetDataFormat(XUartPs *, XUartPsFormat *);
void XUartPs_SetOperMode(XUartPs *, unsigned);
u32 XUartPs_Send(XUartPs *, u8 *, u32);
u32 XUartPs_Recv(XUartPs *, u8 *, u32);
int XUartPs_IsTransmitEmpty(XUartPs *);
#endif
