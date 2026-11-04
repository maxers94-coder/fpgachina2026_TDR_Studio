# 仿真与验证

- `rtl/`：SystemVerilog测试平台。
- `host_tools/`：应用主机测试、独立数值检查与分析工具。
- `host_evidence/`：测试输入、运算结果及验证日志。
- `run_host.ps1`：准备测试所需输入并运行应用回放。

```powershell
powershell -ExecutionPolicy Bypass -File sim/run_host.ps1 -SdkRoot D:/vivado/2026.1
python skill/fixed_point/test_checker.py
python skill/display_mapping/test_payload.py
```

RTL仿真脚本位于 `build/pl_scripts/`，黄金向量位于 `data/vectors/`，运行步骤见 `build/reproduction.md`。应用和主机回放结果见 `build/evidence/`。软件回放验证数值与状态逻辑，RTL仿真验证数据通路与接口，实板测量结合屏幕观察评价物理链路及显示行为。
