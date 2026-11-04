# 构建与复现步骤

## 环境与文件检查

使用Windows和AMD Vivado/Vitis 2026.1，辅助脚本使用Python 3.10或以上版本。在工程根目录执行 `python build/verify_project.py`，可核对文件大小与SHA256。

源文件按功能分类保存，构建脚本通过 `provenance/source_map.json` 准备工具需要的文件名和目录关系。准备步骤自动完成。若Python不在PATH中，给脚本传入 `-PythonExe '实际python.exe路径'`。

## PS应用

```powershell
powershell -ExecutionPolicy Bypass -File build/rebuild_app.ps1 -PythonExe python -SdkRoot D:/vivado/2026.1
```

脚本调用SDK配套的CMake、Ninja和AArch32编译器，并使用工程内的BSP。默认工作目录为 `build/_restored/`，编译结果在 `build/_runs/app_时间/`。可用 `-RestoreDirectory` 与 `-BuildDirectory` 指定其他目录。

应用源码入口为 `src/ps/main.c`。配套ELF的SHA256为 `21cc9ebc4d6bcd2b80799144db2276ea71f32fc83e5380d8bb2b68bda17c4a04`，已有应用重编译结果与其一致。继续开发可在准备出的工作目录修改源码，保留独立输出以便对照。

## 主机回放

```powershell
powershell -ExecutionPolicy Bypass -File sim/run_host.ps1 -PythonExe python -SdkRoot D:/vivado/2026.1
```

脚本使用SDK随附的MinGW GCC，编译应用处理代码，结合实测输入与硬件桩检查候选分析、参考管理和交互状态逻辑。再次运行可通过 `-RestoreDirectory` 指定新目录。日志在准备出的 `pn_dev/work/` 内，已有结果见 `evidence/current_packaging/host_regression.log`。

## PL工程与RTL仿真

```powershell
powershell -ExecutionPolicy Bypass -File build/rebuild_pl.ps1 -PythonExe python -SdkRoot D:/vivado/2026.1
```

该入口准备RTL、约束和硬件配置，调用Vivado生成集成工程、位流和硬件描述。默认输出在 `build/_runs/pl_时间/`。RTL源码和约束分别位于 `src/rtl/`、`src/constraints/`。

测试平台位于 `sim/rtl/`，黄金向量位于 `data/vectors/`。具体仿真脚本在 `build/pl_scripts/`，按对应脚本要求使用准备后的目录关系运行。软件测试、RTL仿真与实板测量分别说明验证范围。

健康参考RTL回放还需要采集数据与黄金向量生成脚本。可先用 `python build/restore_snapshot.py --scope all --output D:/tdr_work/current` 准备当前工程输入，再运行其中 `workspace/vitis_echo200_hmi_ws/echo200_ps_integration/scripts/run_healthy_baseline_replay.ps1`，按实际环境指定 `-Python` 和 `-VivadoBin`。

## 启动与结果

配套启动镜像及组成文件位于 `board/sd_boot/`，SD操作见 `board/usage.md`。需要组合新镜像时，按BIF指向已经核对的加载程序、位流与应用，使用SDK配套Bootgen生成独立输出。

配套硬件的实现报告位于 `build/reports/pl/`。应用与主机测试结果位于 `build/evidence/`。重新编译的软件结果与PL实现、实板结果各自对应其输入和测试条件。
