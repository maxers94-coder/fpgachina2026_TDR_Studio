#ifndef ECHO_PL_REGS_H
#define ECHO_PL_REGS_H

/* PL IP identification */
#define ECHO_IP_ID_VALUE          0x4543484Fu
#define ECHO_IP_VERSION_PHASE2    0x00030001u
#define ECHO_IP_VERSION_PN17      0x00030002u

/* Identification and configuration */
#define ECHO_REG_IP_ID           0x000u
#define ECHO_REG_VERSION         0x004u
#define ECHO_REG_CONFIG_N_M      0x008u
#define ECHO_REG_CONFIG_L_K      0x00Cu
#define ECHO_REG_SAMPLE_RATE_HZ  0x010u

/* Control and status */
#define ECHO_REG_CONTROL         0x014u
#define ECHO_REG_STATUS          0x018u
#define ECHO_REG_IRQ_ENABLE      0x01Cu
#define ECHO_REG_IRQ_STATUS      0x020u

/* Transaction information */
#define ECHO_REG_TRANSACTION_COUNT  0x024u
#define ECHO_REG_RESULT_COUNT       0x028u
#define ECHO_REG_AVERAGE_OVF_COUNT  0x02Cu
#define ECHO_REG_CORR_OVF_COUNT     0x030u

/* Baseline configuration */
#define ECHO_REG_BASELINE_ADDR   0x034u
#define ECHO_REG_BASELINE_DATA   0x038u

/* Template configuration */
#define ECHO_REG_TEMPLATE_ADDR   0x03Cu
#define ECHO_REG_TEMPLATE_DATA   0x040u

/* Correlation results */
#define ECHO_REG_RESULT_ADDR     0x044u
#define ECHO_REG_RESULT_DATA_LO  0x048u
#define ECHO_REG_RESULT_DATA_HI  0x04Cu

/* Error and verification */
#define ECHO_REG_LAST_ERROR      0x050u
#define ECHO_REG_COEFF_CRC       0x054u
/* Phase2 v0x00020001 extensions */
#define ECHO_REG_RESULT_VALID    0x058u
#define ECHO_REG_BASELINE_COUNT  0x05Cu
#define ECHO_REG_TEMPLATE_COUNT  0x060u
#define ECHO_REG_BASELINE_CRC    0x064u
#define ECHO_REG_TEMPLATE_CRC    0x068u
#define ECHO_REG_COEFF_STATUS    0x06Cu
#define ECHO_REG_CAPABILITIES    0x070u
#define ECHO_REG_PULSE_CONFIG    0x074u
#define ECHO_REG_FRAME_CONFIG    0x078u
#define ECHO_REG_PULSE_STATUS    0x07Cu
#define ECHO_REG_FRAME_COUNT     0x080u
#define ECHO_REG_PAIR_RATE_HZ    0x084u
#define ECHO_REG_AVERAGE_ADDR    0x088u
#define ECHO_REG_AVERAGE_DATA    0x08Cu
#define ECHO_REG_AVERAGE_VALID   0x090u
#define ECHO_REG_WAVEFORM_CONFIG 0x094u
#define ECHO_REG_PN_INFO         0x098u
#define ECHO_REG_PN_SEED         0x09Cu
#define ECHO_REG_PN_AMPLITUDE    0x0A0u

#define ECHO_CAP_PULSE_32        (1u << 0)
#define ECHO_CAP_DUAL_LANE      (1u << 1)
#define ECHO_CAP_FRAME_META     (1u << 2)
#define ECHO_CAP_PN127_50M      (1u << 3)
#define ECHO_FRAME_ERROR        (1u << 24)
#define ECHO_ERROR_FRAME_ALIGNMENT (1u << 8)
#define ECHO_ERROR_PULSE_CONFIG    (1u << 9)

#define ECHO_COEFF_BASELINE_COMPLETE         (1u << 0)
#define ECHO_COEFF_TEMPLATE_COMPLETE         (1u << 1)
#define ECHO_COEFF_BASELINE_COMMIT_ACCEPTED  (1u << 2)
#define ECHO_COEFF_TEMPLATE_COMMIT_ACCEPTED  (1u << 3)
#define ECHO_COEFF_BASELINE_COMMIT_REJECTED  (1u << 4)
#define ECHO_COEFF_TEMPLATE_COMMIT_REJECTED  (1u << 5)

/* CONTROL register bits */
#define ECHO_CTRL_START             (1u << 0)
#define ECHO_CTRL_CLEAR_STATUS      (1u << 1)
#define ECHO_CTRL_BASELINE_COMMIT   (1u << 2)
#define ECHO_CTRL_TEMPLATE_COMMIT   (1u << 3)
#define ECHO_CTRL_SOFT_RESET        (1u << 4)

/* STATUS register bits */
#define ECHO_STATUS_COEFF_VALID       (1u << 0)
#define ECHO_STATUS_ADC_READY         (1u << 1)
#define ECHO_STATUS_START_ACCEPTED    (1u << 2)
#define ECHO_STATUS_START_REJECTED    (1u << 3)

#define ECHO_STATUS_BUSY              (1u << 4)
#define ECHO_STATUS_ACQ_BUSY          (1u << 5)
#define ECHO_STATUS_DONE              (1u << 6)
#define ECHO_STATUS_CLIP              (1u << 7)

#define ECHO_STATUS_BASELINE_BANK     (1u << 8)
#define ECHO_STATUS_TEMPLATE_BANK     (1u << 9)

#define ECHO_STATUS_AVG_OVERFLOW      (1u << 19)
#define ECHO_STATUS_CORR_OVERFLOW     (1u << 20)

/* Multi-bit STATUS fields */
#define ECHO_STATUS_RESULT_SHIFT      10u
#define ECHO_STATUS_RESULT_MASK       (0x1FFu << 10)

#define ECHO_STATUS_STATE_SHIFT       21u
#define ECHO_STATUS_STATE_MASK        (0x7u << 21)



#endif /* ECHO_PL_REGS_H */
