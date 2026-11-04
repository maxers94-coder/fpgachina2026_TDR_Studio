# 触摸屏工程

`operator_saved_dis100.hmi`为当前配套屏幕工程。MEASURE页显示差分相关曲线、返回类型及候选距离，WAVEFORM页提供平均采样、差分和相关视图，REFERENCE / CAL页建立健康参考，SETUP / STATUS页显示运行状态。

两处曲线控件 `page0.s_raw`、`page1.s_wave` 使用 `dis=100`，表示数据按100%比例显示。屏幕方向和串口传输顺序使用配套配置，距离轴由PS应用映射。

更换屏幕时，使用与实际型号匹配的TJC编辑器打开HMI并编译下载。工程未附经过验证的TFT成品。系统日常操作见 `board/usage.md`，路径相对工程根目录。
