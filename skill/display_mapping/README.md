# 显示数据顺序与完整性校验

本模块核对逻辑字节序列与传输序列，检查反向传输、长度、截断和FNV值。适用于串口屏、LED阵列及其他一维数据到显示设备的映射。

```powershell
python skill/display_mapping/check_payload.py skill/display_mapping/example.json --reverse
python skill/display_mapping/test_payload.py
```

相同示例不加 `--reverse` 应返回失败，用于演示方向错误。五项测试覆盖方向、截断、已知FNV和越界字节。输入为调用方生成的期望字节及实际字节，输出为一致性结果与不匹配位置。

本项目在波形距离轴对齐中分层检查相关数组、距离投影、逻辑像素和传输顺序。脚本验证给定序列，屏幕物理方向、控件比例和光学刷新还需结合实屏观察；FNV不替代完整字节比较。
