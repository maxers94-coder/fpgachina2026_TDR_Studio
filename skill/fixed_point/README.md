# 整数相关与直流修正校验

本模块提供整数域黄金参考，用于逐点检查基线扣除、滑动乘积累加和直流修正。适用于FPGA相关器、传感器背景校正等场景，不依赖特定距离模型。

输入为采样数组、基线数组、模板、输出点数和直流估计区间，可附期望相关值及修正分子。输出为计算数组和一致性结果，不匹配时返回非零。

```powershell
python skill/fixed_point/check_correlation.py skill/fixed_point/example.json
python skill/fixed_point/test_checker.py
```

检查器仅依赖Python标准库，使用任意精度整数。含饱和、截位或舍入的硬件需按相应语义扩展参考模型，Q格式缩放由接口契约指定。六项测试覆盖逐点结果、基线消除、负极性、宽累加和输入边界。

本项目通过相同方法核对Q2输入、Q14模板和Q16相关结果。系统验证输入位于 `data/captures/`、`data/vectors/`，对应结果位于 `sim/host_evidence/`。
