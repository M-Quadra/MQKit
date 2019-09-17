# MQKit

拖延症巨制, 不定时太监

既然swift ABI稳定, SPM也要来了, 那么就尽量纯swift吧

在QMUI里看到了一些感觉有趣的方法，这里就班门弄斧了

Xcode支持SPM后再考虑集成问题

随缘更新

# UIFont

```
.mq_allFontNames
```

获取系统支持的所有字体

```
.mq_localFontName(forPath: String) -> String
.mq_localFontName(forPath: URL) -> String
```
获取字体文件对应的`fontName`

# UIColor

```
init(hexString: String, alpha: CGFloat = 1)
```

\#RRGGBB 通过HEX创建颜色

```
.mq_random
```

获取一个随机颜色

```
.mq_inverseColor
```

计算反色

```
.mq_red
.mq_green
.mq_blue
.mq_alpha
```

获取RGBA

# String

1. [路径相关](Document/Extension/String/String+MQPath.md)
2. [标示相关](Document/Extension/String/String+MQMark.md)
 (考虑迁移至UIDevice)
3. [编码相关](Document/Extension/String/String+MQCode.md)
4. [字符相关](Document/Extension/String/String+MQChar.md)
5. [子串相关](Document/Extension/String/String+MQSub.md)

# StringEncoding

1. [CFStringEncodings 编码相关](Document/Extension/StringEncoding/CFStringEncodings+MQCode.md)
2. [CFStringEncodings 枚举相关](Document/Extension/StringEncoding/CFStringEncodings+MQList.md)
2. [StringEncoding 编码相关](Document/Extension/StringEncoding/StringEncoding+MQCode.md)
3. [StringEncoding 枚举相关](Document/Extension/StringEncoding/StringEncoding+MQList.md)

# NSMutableAttributedString

```
var mq_color: UIColor?
```

设置富文本的整体文字颜色

```
public var mq_font: UIFont?
```

设置富文本的整体字体

# URL

```
.mq_documents
.mq_caches
.mq_library
.mq_tmp
```

获取`Documents``Caches``Library``tmp`目录URL

# UIView

```
.mq_top
.mq_left
.mq_bottom
.mq_right
.mq_size
.mq_width
.mq_height
```

修改对应UIView属性

```
.mq_parentViewController
```

寻找UIView的上层VC

```
.mq_setShadow(offset: CGSize, effect: CGFloat, color: UIColor)
```

设置阴影，使用贴近标注的命名


```
.mq_shadowPathToFit
```

根据bounds创建shadowPath

# 数值

```
Double.mq_radian(angle: )
CGFloat.mq_radian(angle: )
```

角度值转弧度值

# UIApplication

1. [常用三方 URL Scheme](Document/Extension/UIApplication/UIApplication+MQThird.md)
2. [应用相关信息](Document/Extension/UIApplication/UIApplication+MQInfo.md)

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

# UIImage

```
mq_averageColor
```

获取图片平均色

```
UIImage(layer: CALayer, alpha: Bool)
```

通过CALayer创建UIImage，是否开启alpha通道由外部控制

# UIDevice

1. [硬件相关信息](Document/Extension/UIDevice/UIDevice+MQHardware.md)
2. [软件相关信息](Document/Extension/UIDevice/UIDevice+MQSoftware.md)
3. [设备判断](Document/Extension/UIDevice/设备判断.md)

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

# CGPoint

```
init(mq_xy: CGFloat)
init(mq_xy: Int)
init(mq_xy: Double)
```

创建xy相同的Point

# CGSize

```
init(mq_edge: CGFloat)
init(mq_edge: Int)
init(mq_edge: Double)
```

创建宽高相同的Size

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

# UICollectionView

```
.mq_dequeue<T>(reusableCell: MQReusableCell<T>) -> T
.mq_dequeue<T>(reusableHeader: MQReusableView<T>) -> T
.mq_dequeue<T>(reusableFooter: MQReusableView<T>) -> T
```

复用方法, 后续可能会加入注册

参考[MQCollectionView](Document/MQ_Class.md)

# 零零碎碎

1. [震动反馈](Document/Other/MQTaptic.md)
2. [简易Keychain](Document/Other/MQKeychain.md)
3. [加密解密](Document/Other/MQCrypt.md)
4. [MQCollectionView](Document/MQ_Class.md)
5. [MQTableView](Document/MQ_Class.md)
6. [MQHorizontalPagingView](Document/MQ_Class.md)
7. [MQTextField](Document/Other/MQTextField.md)