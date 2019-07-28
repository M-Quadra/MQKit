# MQKit

备胎工具集, 尽可能使用纯swift实现

swift ABI 都稳定了，那么近期就准备开工吧

在QMUI里看到了一些感觉有趣的方法，就直接搬进来好了

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

1. 路径相关 String+MQPath
2. 标示相关 String+MQMark (考虑迁移至UIDevice)
3. 编码相关 String+MQCode
4. 字符相关 String+MQChar

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

```
mq_openQQGroup(qqGroup: String) -> Bool
```

打开QQ群名片

```
.mq_appDisplayName
.mq_appBundleIdentifier
.mq_appVersion
.mq_appBluidVersion
```

app相关信息

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

# UIImage

```
mq_averageColor
```

获取图片平均色

```
UIImage(layer: CALayer, alpha: Bool)
```

通过CALayer创建UIImage，是否开启alpha通道由外部控制

# MQTaptic

```
MQTaptic.tap(type: type)
```

震动反馈

# UIDevice

```
.mq_isJailbroken
```

检测设备是否越狱(建议直接复制代码并使用exit(0))

```
.mq_totalCapacity
```

获取总容量

```
.mq_availableCapacity
```

获取可用容量

```
.mq_totalMemory
```

获取总内存大小

```
.mq_availableMemory
```

获取可用内存大小(低于实际值)

# Dictionary

```
.mq_jsonString(encoding: String.Encoding = .utf8) -> String
```

dic转json

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

# [相关控件](https://github.com/M-Quadra/MQKit/blob/master/Document/MQ_Class.md)
