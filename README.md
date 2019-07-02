# MQKit
备胎工具集

swift ABI 都稳定了，那么近期就准备开工吧

在QMUI里看到了一些感觉有趣的方法，就直接搬进来好了

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

# String

```
.mq_documents
.mq_caches
.mq_library
.mq_tmp
```

获取`Documents``Caches``Library``tmp`目录path

```
.mq_IDFA
```

获取IDFA

```
.mq_md5
```
32位 小写 md5

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
```

修改对应UIView属性

```
.mq_parentViewController
```

寻找UIView的上层VC

# 数值

```
Double.mq_radian(angle: )
```

角度值转弧度值

# UIKit

```
MQCollectionView
MQTableView
```

为了更方便地写卡片滑动，延伸出了控制`hitTest`的闭包

神™的swift不能自动补全闭包，没办法，改成func了

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