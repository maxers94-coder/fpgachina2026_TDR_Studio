# 采集数据索引

以下为原采集清单的文件分组。ZIP与解压结果并存，数量不是独立测试次数。

|目录|文件数|内容|
|---|---:|---|
|captures/|68|早期PN采集与阶段分析|
|captures/calibration/|45|PN距离拟合与留出验证|
|captures/continuous_distance/|58|连续、停止、显示及串口文本记录|
|captures/fault_classification/|192|末端开短路样返回与弱返回分型|
|captures/fixtures/|1|回放夹具|
|captures/healthy_baseline/|149|参考建立、差分、正常与控制试验|
|captures/hmi_visual/|9|显示证据|
|captures/long_distance/|143|25/29/33m长线采集|
|captures/normal_reconnect/|22|正常拆装背景重复性|
|captures/performance/|43|刷新耗时与快速路径|
|captures/screen_control/|75|屏幕单次、连续、停止和页面控制|
|captures/startup_controls/|50|上电及参考门控对照|
|captures/unified_range/|281|统一范围与近端、双板采集|
|captures/weak_development/|382|A–E开发采集|
|captures/weak_distance_validation/|477|弱返回定位与模型验证|
|captures/weak_positions/|5|移动同板位置对照|

总计：2,000个原采集文件，76,294,823字节。

## 数据配对

按实验目录中的接线配置、参考CRC和测量序号查找对应文本。测量摘要、原始数组和相关数组分别用于状态核对、采样分析与数值重算。源文件路径映射见 `build/provenance/source_map.json`，新增测量的记录方法见 `board/usage.md`。
