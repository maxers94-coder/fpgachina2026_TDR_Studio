# FW63 V1.0 竞赛全部代码包

本包为同轴线缆异常检测与定位系统的完整代码及复现材料。PL、PS、触摸屏与PC端均已包含。请在可写目录解压整个TDR文件夹，保留相对路径。

## 版本与硬件

- 主控：AC820 / XC7Z020CLG484-2；转换子卡：FMCADDA-5474-9142。
- PS最终应用：FW63 / STAGE63；配套已验证PL位流沿用echo_pn_stage17.bit命名，BIF明确其与echo_pn_stage63.elf的组合关系。
- ADC 200 MSPS、PN127 50 Mchip/s、1024点/帧、32帧平均、640点相关模板、256个64位Q16结果。
- 保留最终应用实际引用的辅助模块、历史命名的测试夹具及配套BSP，不能仅凭文件名中的较早阶段编号删除这些依赖。

## 文件入口

|目录|内容|
|---|---|
|src/rtl、src/constraints|实际RTL、MEM、引脚和时序约束|
|src/ps|最终C源码、头文件、链接脚本与CMake配置，入口main.c|
|src/hmi/current|TJC屏幕HMI源工程与使用说明|
|src/pc|完整PC平台ZIP、内部332文件清单与解压运行说明；ZIP内包含Python源码、SQL、离线依赖及数据库|
|build|Vivado/Vitis构建脚本、必要BSP/IP配置、来源映射及实现证据|
|board|接线、操作、SD启动镜像及BIF/ELF/BIT/XSA|
|sim、data|测试程序、黄金向量、回放输入及实验数据|
|skill|定点运算与显示映射检查工具及测试|
|report/reference|板卡、FMC子卡原理图与手册|

已排除.git、Python缓存和本次本地重建产生的工作目录。为保持自动恢复及复现完整，保留source_map实际引用的工程和平台文件。工具安装程序、许可证与本机打包工具不随包提交。设计报告按要求在竞赛平台单独提交PDF。

## 完整性检查

在TDR根目录运行：

```powershell
python build/verify_project.py
```

校验覆盖包内索引文件的大小与SHA-256，同时检查7304个映射输入及原始BOOT身份。详细结果见build/evidence/submission_20261104。build/provenance/source_map.json保持与原最终工程一致；file_index.json按本次实际提交内容重新建立。原清单中3处更新过的说明文档及1份不存在的报告条目已核对记录，未以刷新索引替代对代码的验证。

## 重新构建与验证

Windows，Vivado/Vitis 2026.1，Python 3.10以上。以下SdkRoot须替换为本机2026.1安装根目录；本次实测为D:/AMDDesignTools/2026.1。

```powershell
powershell -ExecutionPolicy Bypass -File build/rebuild_app.ps1 -SdkRoot D:/AMDDesignTools/2026.1
powershell -ExecutionPolicy Bypass -File sim/run_host.ps1 -SdkRoot D:/AMDDesignTools/2026.1
powershell -ExecutionPolicy Bypass -File build/rebuild_pl.ps1 -SdkRoot D:/AMDDesignTools/2026.1
python build/run_skill_checks.py
```

脚本依据source_map将分类保存的文件恢复为工具所需的文件名与层级，再进行构建。选择短的英文可写工作目录有利于避免Windows工具路径限制。重复主机回放需用-RestoreDirectory指定新的独立目录；已有输出不会被覆盖。完整步骤见build/reproduction.md。

PC平台按src/pc/README.md解压到独立工作目录，再执行start.bat。HMI源工程需使用匹配屏幕型号的TJC编辑器编译，不把未经验证的TFT成品作为交付固件。

## 测量使用与功能边界

SD启动使用board/sd_boot/boot.bin，复制到FAT32卡根目录时命名为BOOT.BIN。板端UART0连接屏幕，UART1提供电脑日志；健康参考在RAM中，上电后需建立。完整接线与操作见board/usage.md。

PC端已实现人工录入、批量粘贴、SQLite管理、附件、统计和导出；自动UART日志解析和完整Q16波形回放尚未实现。随包数据库与data/production_acceptance正式分析快照的差异已在src/pc/README.md说明，保留原始数据，不伪造同步。

本次为离线提交验证，未连接实物板卡重新测量；保持原有已验证BOOT及其配套ELF/BIT，不用新重建位流替换上板版本。新增检查证据与原有实板证据分别保留。

## 本次提交检查结果

- 7304个映射输入SHA-256全部通过，原始BOOT保持不变。
- PS重新编译成功，整个ELF与原交付文件逐字节一致。
- 主机回归157组、215476项检查、71个真实RAW回放通过。
- 定点与显示检查11项单测、3个CLI场景通过。
- PC平台48项测试（含隐藏窗口页面导航）通过；332文件与SQLite完整性检查通过。
- RTL回放53个用例通过，共核对54272个差分值、13568个相关结果和13568个BRAM读回值。
- PL全流程重建生成位流成功；WNS=0.165 ns，WHS=0.039 ns，DRC错误门禁通过。
- 未进行新的实板操作；测量能力沿用原有实板记录。本次生成的测试产物保留在独立工作目录，不替换已上板验证的启动镜像。

CDC静态报告仍保留原工程的CDC-10（3项，复位同步器之前组合逻辑）和CDC-11（4项，源寄存器跨域扇出）Critical项，另有CDC-6及CDC-15 Warning。这些不是本次新增，未在此次打包中关闭或豁免，不能宣称CDC零告警或已证明所有异步情况安全。为保护已实板验证版本，本次不临时修改RTL或替换BOOT。Vivado另包含工具启动日志写入诊断及常规综合/约束告警；构建通过、时序通过和DRC无错误分别报告，不等同于所有静态检查清零。完整日志与报告见build/evidence/submission_20261104。
