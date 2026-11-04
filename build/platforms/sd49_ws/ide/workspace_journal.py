# 2026-10-31T21:10:34.895446400
import vitis

client = vitis.create_client()
client.set_workspace(path="sd49_ws")

platform = client.get_component(name="tdr_sd49_platform")
domain = platform.get_domain(name="zynq_fsbl")

domain = platform.get_domain(name="zynq_fsbl")

status = domain.set_config(option = "os", param = "standalone_stdin", value = "ps7_uart_1")

status = domain.set_config(option = "os", param = "standalone_stdout", value = "ps7_uart_1")

status = platform.build()

vitis.dispose()

