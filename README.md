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
```

- 修改对应UIView属性

# 数值

```
Double.mq_radian(angle: )
```

- 角度值转弧度值