# 工程构建

|入口或目录|作用|
|---|---|
|rebuild_app.ps1|准备应用源码与配套平台文件，编译PS应用|
|rebuild_pl.ps1|准备RTL、约束和配置，生成Vivado工程并完成实现|
|verify_project.py|检查文件大小、SHA256和启动镜像完整性|
|pl_scripts/|PL构建、仿真和数据分析脚本|
|platforms/|配套平台与BSP|
|reports/pl/|时序、资源、CDC和DRC报告|
|evidence/|应用构建与软件验证结果|

完整步骤见 [reproduction.md](reproduction.md)。构建使用当前工程附带的输入文件，自动生成独立工作目录。生成的ELF或BIT不会自动替换SD卡启动文件。
