#include <stdint.h>

#include "echo_mmio.h"
#include "xil_io.h"

/*
 * Real Zynq-7000 bare-metal MMIO backend.
 *
 * Link this file in the Vitis application INSTEAD OF
 * tests_host/mock_mmio.c. Do not link both implementations.
 *
 * base is the AXI peripheral base address assigned in Vivado.
 * offset is a byte offset from echo_pl_regs.h.
 */
uint32_t mmio_read32(uintptr_t base, uint32_t offset)
{
    return (uint32_t)Xil_In32((UINTPTR)(base + (uintptr_t)offset));
}

void mmio_write32(uintptr_t base, uint32_t offset, uint32_t value)
{
    Xil_Out32((UINTPTR)(base + (uintptr_t)offset), (uint32_t)value);
}
