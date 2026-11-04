#ifndef ECHO_MMIO_H
#define ECHO_MMIO_H

#include <stdint.h>

/* Read a 32-bit register */
uint32_t mmio_read32(uintptr_t base, uint32_t offset);

/* Write a 32-bit register */
void mmio_write32(uintptr_t base, uint32_t offset,
                  uint32_t value);

#endif /* ECHO_MMIO_H */