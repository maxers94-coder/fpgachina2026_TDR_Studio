#include <stddef.h>
#include <string.h>

#include "echo_bringup.h"
#include "echo_pl.h"
#include "echo_pl_regs.h"
#include "echo_mmio.h"

int echo_bringup(uintptr_t base,
                 const struct echo_hw_info *expected,
                 struct echo_bringup_report *report)
{
    if (expected == NULL || report == NULL)
        return -1;

    memset(report, 0, sizeof(*report));

    int rc = echo_hw_check(base, expected, &report->actual,
                           &report->mismatch);
    if (rc == -2)
        return -2;
    if (rc == -3)
        return -3;
    if (rc != 0)
        return -4;

    if (echo_init(base) != 0)
        return -4;

    struct echo_status s;
    if (echo_get_status(&s) != 0)
        return -4;

    report->status = s.raw;
    report->last_error = mmio_read32(base, ECHO_REG_LAST_ERROR);
    if (report->last_error != 0u)
        return -7;
    if ((s.raw & (ECHO_STATUS_BUSY | ECHO_STATUS_ACQ_BUSY)) != 0u)
        return -6;
    if ((s.raw & ECHO_STATUS_ADC_READY) == 0u)
        return -5;

    return 0;
}
