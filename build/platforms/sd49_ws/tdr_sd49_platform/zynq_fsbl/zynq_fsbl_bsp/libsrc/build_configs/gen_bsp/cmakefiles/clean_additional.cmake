# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\diskio.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ff.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ffconf.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\sleep.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs_config.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilrsa.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xiltimer.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xtimer_config.h"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilffs.a"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilrsa.a"
  "D:\\vivado_project\\sd49_ws\\tdr_sd49_platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxiltimer.a"
  )
endif()
