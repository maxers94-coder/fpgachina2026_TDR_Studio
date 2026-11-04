# 系统使用说明

## 上电与建立参考

1. 板卡断电，将 `board/sd_boot/boot.bin` 复制到FAT32卡根目录。安全弹出后插回板卡，按 `board/sd_boot/boot_switch_reference.png` 的板卡方向设置SD启动。
2. 上电后屏幕显示HOST ONLINE，无需Vitis Run或Debug。电脑调试串口使用115200、8N1、无流控。
3. 按计划测量的线序，用正常直通连接通路，远端接50Ω负载，所有异常板取下。
4. 进入REFERENCE / CAL，按CAPTURE HEALTHY REF，在15秒确认窗口内按CONFIRM 50 OHM。等待VALID RAM REF，期间不切页、不换线。
5. 回到MEASURE，先执行PN DIFF SINGLE。正常配置预期LOW RETURN、距离“-- m”、曲线靠近中线。

健康参考保存在RAM中。重新上电、复位或改变线缆长度、顺序及正常接头结构后，需按新的正常配置重新建立。参考建立时保持正常直通和50Ω终接。

## 测量操作

将目标位置的直通替换为异常板，其余通路保持不变。PN DIFF SINGLE执行一次测量，CONTINUOUS持续更新，STOP在安全边界停止并保留最后完整结果。切换页面也会结束连续测量。恢复原直通后再次SINGLE，正常结果应清除此前距离。

MEASURE曲线为相对健康参考的PN差分相关结果。向上、向下分别提示正、负返回；横轴为名义距离。FULL显示0–35m观察窗，ZOOM围绕候选自适应放大。标称验证范围止于33m，边界星号表示超出该范围的观察值。

|显示|含义|
|---|---|
|LOW RETURN / -- m|未形成通过当前规则的距离候选|
|POSITIVE / NEGATIVE RETURN|普通正、负返回候选|
|OPEN-LIKE / SHORT-LIKE|较强的开路样、短路样返回|
|* / EDGE*|超出33m边界的估计，需进一步确认|
|PN?|疑似序列旁瓣或伴随响应|
|OVERFLOW|局部候选容量已满，仍可能存在未保留的峰|

列表按距离排序，大号距离显示主要候选。WAVEFORM页的AVG32、DIFFERENCE和CORRELATION分别为平均采样、参考扣除及相关结果。该页可重绘缓存帧，切页本身不代表新采样。

## 保存完整数据

1. 关闭VOFA等占用电脑串口的软件，双击 `board/record_log.cmd`，输入实际端口号。
2. 工具窗口按 `V` 查询设备信息，等输出结束；按 `J` 导出健康参考，等 `BASE_END`。
3. 屏幕测量完成后先STOP。工具按 `R` 等 `RAW_END`，再按 `C` 等 `DCORR_END`，最后按 `V`。
4. 导出期间保持同一参考与测量帧，不再SINGLE或重建参考。按 `Q` 结束记录；这些按键无需回车，Q不替代屏幕STOP。

工具保存到 `board/captures/continuous_distance/serial_text_时间/`，包含接收文本、发送记录和会话状态。完整数值重算需要同一测量序号的参考、RAW与相关数组，仅有摘要时可核对范围限于摘要信息。

HOST OFFLINE时检查供电、启动和串口接线。参考为NONE时检查是否发生复位或重新上电。出现DENIED时保存首次提示，核对当前页面、参考状态和测量忙闲。同一串口同时只由一个程序占用。

## PC端实验记录与分析

配套 [TDR Measurement Studio](../src/pc/README.md) 的完整目录位于 `src/pc/tdr_measurement_studio.zip`。先按PC说明解压到独立可写目录，再运行 `start.bat`。

屏幕测量与串口采集完成后，在平台选择相应实验配置，手工录入或批量粘贴状态、候选位置、极性和质量标记，并将串口日志关联为附件。多异常应逐项填写真实试件与位置，再检查候选匹配、漏检及额外候选。参考编号、CRC和测量序号可在备注与日志中保留关联。

平台当前不自动读取串口或解析RAW/CORR数组，也不在板端建立健康参考。导出会包含全部批次的配置，分析需按批次筛选。生产验收数据的正式统计和平台原始数据库快照的差异见 [生产验收分析数据](../data/production_acceptance/README.md)。
