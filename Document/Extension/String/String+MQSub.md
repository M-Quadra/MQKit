#String

```
.mq_substring(with range: Range<Int>) -> String
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

```
.mq_substring(with range: ClosedRange<Int>) -> String
```

获取[st, ed]位置子串, 支持负数操作, 边界判断

测试字符串: "12345" | 运行结果
:--------:|:--:
-2...(-1) | "45"
-1...0    | "5"
0...1		| "12"
0...0		| "1"

```
.mq_substring(with range: PartialRangeThrough<Int>) -> String
```

获取[0, ed]位置子串, 支持负数操作, 边界判断

```
.mq_substring(with range: PartialRangeUpTo<Int>) -> String
```

获取[0, ed)位置子串, 支持负数操作, 边界判断

```
.mq_substring(with range: PartialRangeFrom<Int>) -> String
```

获取[st, +∞)位置子串, 支持负数操作, 边界判断

```
.mq_substring(with index: Int) -> String
```

获取基于`.count`索引位置的当个子串

测试字符串: "1⅚qwe😊😞a万" | 运行结果
:--------:|:--:
0         | "1"
1         | "⅚"
-1        | "万"
-3		   | "😞"