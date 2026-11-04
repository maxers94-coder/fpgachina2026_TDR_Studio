#ifndef ECHO_TRANSACTION_H
#define ECHO_TRANSACTION_H

#include <stdint.h>

/* Platform monotonic clock, milliseconds */
typedef uint64_t (*echo_now_ms_fn)(void);

/*
 * Return values:
 *  0 : Success
 * -1 : Invalid argument
 * -2 : Driver not initialized
 * -3 : Timeout
 * -4 : Start rejected
 * -5 : Invalid measurement data
 * -6 : Incorrect result count
 * -7 : PL not ready or already busy
 * -8 : DONE without START_ACCEPTED
 * -9 : CLEAR_STATUS did not clear sticky flags
 * -10: PL LAST_ERROR is nonzero; abort without reading results
 * -11: Transaction count jumped by more than one (unexpected transaction)
 */

/* Wait for transaction completion */
int echo_wait_done(uint32_t timeout_ms,
                   echo_now_ms_fn now_ms);

/* Snapshot taken on either side of CLEAR_STATUS. Some PL revisions reset
 * TRANSACTION_COUNT on CLEAR_STATUS; therefore this is not necessarily a
 * boot-lifetime cumulative counter. A successful transaction must increase
 * the count exactly once relative to the snapshot AFTER the clear. */
typedef struct {
    uint32_t tx_on_entry;
    uint32_t tx_after_clear;
    uint32_t tx_on_completion;
} echo_transaction_trace_t;

int echo_run_transaction_traced(uint32_t timeout_ms,
                                echo_now_ms_fn now_ms,
                                echo_transaction_trace_t *trace);

/* Execute one complete measurement transaction */
int echo_run_transaction(uint32_t timeout_ms,
                         echo_now_ms_fn now_ms);

#endif