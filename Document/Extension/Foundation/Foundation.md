# Foundation 相关扩展

# String

1. [路径相关](./String/String+MQPath.md)
2. [标示相关](./String/String+MQMark.md) (考虑迁移至UIDevice)
3. [编码相关](./String/String+MQCode.md)
4. [字符相关](./String/String+MQChar.md)
5. [子串相关](./String/String+MQSub.md)
6. [数值相关](./String/String+MQSub.md)
7. [大小相关](./String/String+MQSize.md)
8. [正则相关](./String/String+MQRegularExpression.md)

# StringEncoding

1. [CFStringEncodings 编码相关](./StringEncoding/CFStringEncodings+MQCode.md)
2. [CFStringEncodings 枚举相关](./StringEncoding/CFStringEncodings+MQList.md)
2. [StringEncoding 编码相关](./StringEncoding/StringEncoding+MQCode.md)
3. [StringEncoding 枚举相关](./StringEncoding/StringEncoding+MQList.md)

# NSMutableAttributedString

```
var mq_color: UIColor?
```

设置富文本的整体文字颜色

```
public var mq_font: UIFont?
```

设置富文本的整体字体

```
public var mq_lineSpacing: CGFloat
```

NSParagraphStyle.lineSpacing

```
public var mq_alignment: NSTextAlignment
```

NSParagraphStyle.alignment

```
.mq_setFont(_ font: UIFont?, range: NSRange)
.mq_setFont(_ font: UIFont?, range: Range<String.Index>?)
```

局部字体设置

```
.mq_setColor(_ color: UIColor, range: NSRange)
.mq_setColor(_ color: UIColor, range: Range<String.Index>?)
```

局部文字颜色设置

# URL

```
.mq_documents
.mq_caches
.mq_library
.mq_tmp
```

获取`Documents``Caches``Library``tmp`目录URL

```
init?(mq_srcURL: String, href: String)
```

根据`href`创建完整网址

# Date

```
.mq_year
.mq_month
.mq_day
.mq_hour
.mq_minute
.mq_second
```

获取 年/月/日/小时/分钟/秒

```
init(mq_str: String, formatter: String, timeZone: TimeZone = TimeZone.current)
```

String 转 Date

```
func mq_stringValue(formatter: String, timeZone: TimeZone = TimeZone.current) -> String
```

Date 转 String

# Dictionary

```
.mq_jsonString(encoding: String.Encoding = .utf8) -> String
```

dic转json


# Array

```
.mq_jsonString(encoding: String.Encoding = .utf8) -> String
```

Array转json

# OperationQueue

```
.mq_single
```

串型队列, 最大并发数 = 1

```
.mq_mid
```

并行队列, 最大并发数 = 线程数/2

```
.mq_max
```

并行队列, 最大并发数 = 线程数

# Number

1. [整数相关](./Number/FixedWidthInteger+MQ.md)
2. [Decimal相关](./Number/Decimal+MQ.md)
3. [幂运算](./Number/Pow+MQ.md)

# NSRegularExpression

```
public func mq_firstMatch(in string: String) -> NSTextCheckingResult?
```

由于懒得写范围于是加了这个全文匹配方法

```
public func mq_matches(in string: String) -> [NSTextCheckingResult]
```

由于懒得写范围加了这个全文匹配的方法

# CharacterSet

```
public func union(mq_in: String) -> Self
public func subtracting(mq_in: String) -> Self
public func symmetricDifference(mq_in: String) -> Self
```

简化`String`相关操作代码