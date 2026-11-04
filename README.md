# 同轴线缆异常检测与定位系统

> **报名名称与实际作品说明（重要）**
>
> 竞赛报名系统中的作品名称为“可重构数字系统与协议分析仪”，这是报名阶段填写的方向名称；报名截止后系统字段锁定，无法自行修改。
>
> 本仓库实际开发并提交的作品是 **同轴线缆异常检测与定位系统（TDR）**，不是协议分析仪。全部源码、RTL、PS、仿真、实测数据、报告和演示均对应 TDR 作品。团队于 2026-10-04 完成选题论证后按 TDR 方向实施；因报名系统无法修改名称，特在仓库首页明确说明。
>
> 详细时间线与说明见 [topic_notice.md](topic_notice.md)。

本作品基于Zynq-7020实现单端同轴线缆测量。近端DAC输出PN序列，ADC经电阻式功分器接收返回信号，通过帧平均、健康参考扣除和相关处理观察阻抗变化，并在触摸屏上显示返回类型、波形及候选位置。

## 主要功能

- 端点开路样、短路样返回识别，以及局部弱阻抗异常的正负返回观察与定位。
- 健康参考建立、单次测量、连续测量、停止保持和恢复正常后清除距离。
- 多局部峰提取、距离排序列表、整体波形和局部放大显示。
- SD卡独立上电运行，电脑串口导出实验数据。
- 配套PC端平台管理实验计划、试件、逐次结果、统计图表和结构化数据导出。

强末端返回的标称范围为0–33m，弱异常候选的标称范围为1–33m。实验覆盖多个离散位置及指定样品组合，已验证四板配置的候选呈现。局部候选最多8项、屏幕最多6项，检出结果受峰间距、强弱比、旁瓣和噪声影响。远端开短路与中间弱异常的联合检测不在已验证范围内。

## 工程目录

```text
TDR/
├── README.md
├── src/       RTL、约束、PS软件、屏幕设计和PC数据管理平台
├── sim/       测试平台、验证工具和结果
├── build/     构建脚本、平台文件、实现报告和校验清单
├── board/     启动文件、接线和操作说明
├── data/      实测数据、黄金向量和参考结果
├── skill/     可复用方法、检查脚本和示例
└── report/    设计报告、协作记录和参考资料
```

## 快速开始

1. 按 [接线说明](board/wiring.md) 连接主板、转换子卡、功分器和屏幕。ADC IN1与DAC OUT1均在近端。
2. 板卡断电，将 `board/sd_boot/boot.bin` 复制到FAT32卡根目录并命名为 `BOOT.BIN`，按 `board/sd_boot/boot_switch_reference.png` 设置SD启动。上电后屏幕显示HOST ONLINE。
3. 使用正常直通和远端50Ω连接测试通路，在REFERENCE / CAL页建立健康参考。
4. 回MEASURE执行单次或连续测量。正常通路预期LOW RETURN和“-- m”；替换异常板后观察曲线及位置列表。

完整步骤见 [使用说明](board/usage.md)。参考保存在RAM中，重新上电或改变正常通路结构后需重新建立。屏幕源工程位于 `src/hmi/current/`；更换屏幕时需使用匹配型号的TJC编辑器编译下载，工程未附经过验证的TFT成品。

## PC端数据管理

[TDR Measurement Studio](src/pc/README.md) 提供独立Windows桌面平台，管理实验配置、健康参考信息、单次与多异常结果、统计分析及Excel/CSV/JSON导出。完整平台源码、离线依赖、数据库和配套资料保存在 `src/pc/tdr_measurement_studio.zip`，按说明完整解压到可写目录后运行 `start.bat`。

平台目前通过手工录入或批量粘贴记录结果，串口原始日志作为附件关联。板卡测量、健康参考建立和串口数组导出按板端使用说明执行。最新报告使用的结构化数据与图表见 [生产验收分析数据](data/production_acceptance/README.md)；该分析包与平台随附数据库的PB16记录、25 m试件关联存在差异，采用数据前应核对对应说明。

## 构建与验证

环境为Windows、Python 3.10或以上版本、AMD Vivado/Vitis 2026.1。在工程根目录执行，SdkRoot按实际安装位置设置：

```powershell
# 编译PS应用
powershell -ExecutionPolicy Bypass -File build/rebuild_app.ps1 -SdkRoot D:/vivado/2026.1

# 生成Vivado工程并完成综合实现
powershell -ExecutionPolicy Bypass -File build/rebuild_pl.ps1 -SdkRoot D:/vivado/2026.1

# 运行应用主机回放
powershell -ExecutionPolicy Bypass -File sim/run_host.ps1 -SdkRoot D:/vivado/2026.1

# 检查文件完整性
python build/verify_project.py
```

构建脚本自动按源文件映射准备工具所需的工作目录，再执行编译。当前分类目录中的文件名和路径不直接作为工具工作区使用，无需手工调整源码位置。脚本保留现有输出，重复执行可指定新的输出目录。详细步骤见 [构建说明](build/reproduction.md)。

## License

MIT License, see [LICENSE](LICENSE).

## 报告与数据

竞赛设计报告：[DOCX](report/competition_report.docx) · [PDF](report/competition_report.pdf)。报告第 2 页包含报名名称与实际作品的选题说明；另提供 AI 协作记录、测试范围和数据结构说明。[数据说明](data/README.md) 说明实验分组及结果配对方法，[大模型协作说明](report/ai_collaboration.md) 记录辅助开发方式和验证方法。功能与测试条件见 [测试范围](report/release_scope.md)。
