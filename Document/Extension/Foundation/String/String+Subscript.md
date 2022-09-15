# String+Subscript 下标相关

由于常态使用下, 每次都要手动转Index的行为令人十分烦躁, 干脆直接参考Python的效果



```
subscript (range: Range<Int>) -> Substring
```

获取[st, ed)位置子串, 支持负数操作, 边界判断

由于`swift`的`Range`不支持前大后小, 所以没法像`python`般灵活地切片

测试字符串: "" | 运行结果
:--------:|:--:
-2..<(-1) | ""
-1..<0    | ""
0..<1		| ""

测试字符串: "12345" | 运行结果
:--------:|:--:
-2..<(-1) | "4"
-1..<0    | "5"
0..<1		| "1"
0..<0		| ""



```swift
subscript (index: Int) -> Substring
```
获取基于`.count`特定位置字符

测试字符串: "1⅚qwe😊😞a万" | 运行结果
:--------:|:--:
0         | "1"
1         | "⅚"
-1        | "万"
-3		   | "😞"




```sw
subscript (rang: ClosedRange<Int>) -> Substring
```

获取[st, ed]位置子串, 支持负数操作, 边界判断

测试字符串: "12345" | 运行结果
:--------:|:--:
-2...(-1) | "45"
-1...0    | "5"
0...1		| "12"
0...0		| "1"



```
subscript (rang: PartialRangeFrom<Int>) -> Substring
```

获取[st, +∞)位置子串, 支持负数操作, 边界判断



```
subscript (rang: PartialRangeThrough<Int>) -> Substring
```

获取[0, ed]位置子串, 支持负数操作, 边界判断



```
subscript (rang: PartialRangeUpTo<Int>) -> Substring
```

获取[0, ed)位置子串, 支持负数操作, 边界判断

