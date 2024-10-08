# Foundation 相关扩展

## String

1. [路径相关](./String/String+MQPath.md)
3. [编码相关](./String/String+MQCode.md)
4. [字符相关](./String/String+MQChar.md)
5. [大小相关](./String/String+MQSize.md)
6. [正则相关](./String/String+MQRegularExpression.md)
7. [子串相关](./String/String+Subscript.md)
8. [其他](./String/String+MQ.md)



## String.Encoding

1. [CFStringEncodings 编码相关](./StringEncoding/CFStringEncodings+MQCode.md)

2. [CFStringEncodings 枚举相关](./StringEncoding/CFStringEncodings+MQList.md)

   

```swift
public init(_ cfStrEncoding: CFStringEncodings)
```

`CFStringEncodings`转`String.Encoding`



```swift
public static var allValues: [String.Encoding] { get }
```

获取所有编码, 包括`CFStringEncodings`的可用部分, 过滤无法从`""`转换`Data`的编码



```swift
public static let GB_18030_2000: String.Encoding
public static let KOI8_R: String.Encoding
public static let big5: String.Encoding
...
```

直接获取`CFStringEncodings`定义的编码



## Substring

1. [子串相关 (同String)](./String/String+Subscript.md)
2. [其他](./Substring+MQ.md)



## URL

```
.mq_documents
.mq_caches
.mq_library
.mq_tmp
```

获取`Documents``Caches``Library``tmp`目录URL



## Dictionary

```
.mq_jsonString(encoding: String.Encoding = .utf8) -> String
```

dic转json



## Number

1. [整数相关](./Number/FixedWidthInteger+MQ.md)
2. [Decimal相关](./Number/Decimal+MQ.md)
3. [幂运算](./Number/Pow+MQ.md)

## NSRegularExpression

```
public func mq_firstMatch(in string: String) -> NSTextCheckingResult?
```

由于懒得写范围于是加了这个全文匹配方法

```
public func mq_matches(in string: String) -> [NSTextCheckingResult]
```

由于懒得写范围加了这个全文匹配的方法

## CharacterSet

```
public func union(mq_in: String) -> Self
public func subtracting(mq_in: String) -> Self
public func symmetricDifference(mq_in: String) -> Self
```

简化`String`相关操作代码

## Bundle

```
.displayName
```

应用名

```
.version
```

应用版本号

```
.bluidVersion
```

应用构建版本号



## Data

```swift
public func hexEncodeString() -> String
```

Data转换hex

```swift
public init?(hexEncoded hex: String)
```

hex转Data



## Task

```swift
public static func sleep(millisecond duration: UInt64) async throws
```

添加更常用的毫秒支持



## RangeExpression

```swift
public static func !~= (a: Self, b: Bound) -> Bool
```

等效`!(a ~= b)`



## UInt8

```swift
public static var random: UInt8 { get }
```

随机数



## Array

```swift
Element == UInt8
public static func random(_ count: Int) -> [Element]
```

随机数组生成

```
Element : Hashable
public var unique: [Element] { get }
```

去重

```swift
public func subscriptOrNil(_ index: Int) -> Element?
```

安全取下标



## NSMutableAttributedString

```swift
public func append(_ attachment: NSTextAttachment)
```

直接添加`NSTextAttachment`



## Comparable

```swift
func clamp<T : Comparable>(low: T, value: T, high: T) -> T
```

三值取中



## Date



###  获取 年/月/日/小时/分钟/秒

```swift
var year: Int { get }
var month: Int { get }
var day: Int { get }
var hour: Int { get }
var minute: Int { get }
var second: Int { get }
```



### String 转 Date

```swift
init?(_ str: String, formatter: String, timeZone: TimeZone = TimeZone.current)
```



### Date 转 String

```swift
func stringValue(formatter: String, timeZone: TimeZone = TimeZone.current) -> String
```



## OperationQueue



### 最大并发数 = 1

```swift
static var single: OperationQueue { get }
```



### 最大并发数 = 可用线程数/2

```swift
static var mid: OperationQueue { get }
```



### 最大并发数 = 可用线程数

```swift
static var full: OperationQueue { get }
```

