# 2026-10-31T21:06:11.428187700
import vitis

client = vitis.create_client()
client.set_workspace(path="sd49_ws")

platform = client.create_platform_component(name = "tdr_sd49_platform",hw_design = "$COMPONENT_LOCATION/../../vitis_echo200_hmi_ws/pn_dev/work/sd49_system.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="tdr_sd49_platform")
status = platform.build()

vitis.dispose()

