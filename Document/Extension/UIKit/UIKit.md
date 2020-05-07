# UIKit 相关扩展

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
init(mq_backgroundColor: UIColor, frontColor: UIColor)
```

混色

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

1. [常用三方 URL Scheme](./UIApplication/UIApplication+MQThird.md)
2. [应用相关信息](./UIApplication/UIApplication+MQInfo.md)


# UIImage

```
mq_averageColor
```

获取图片平均色

```
UIImage(mq_layer: CALayer, alpha: Bool)
```

通过CALayer创建UIImage, 是否开启alpha通道由外部控制

```
UIImage(mq_color color: UIColor, size: CGSize = CGSize(mq_edge: 1))
```

通过color创建UIImage, 默认大小CGsize(1, 1)

```
.mq_corner(radius: CGFloat, corners: UIRectCorner = .allCorners) -> UIImage
```

图片切圆角

```
.mq_pixelRGBA() -> [[[UInt8]]]?
```

获取像素

# UIDevice

1. [硬件相关信息](./UIDevice/UIDevice+MQHardware.md)
2. [软件相关信息](./UIDevice/UIDevice+MQSoftware.md)
3. [设备判断](./UIDevice/设备判断.md)

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

```
.mq_area
```

面积

```
.mq_isValidated() -> Bool
```

有效性检查, !<=0 && !isInf() && !isNaN()

# UICollectionView

```
.mq_dequeue<T>(reusableCell: MQReusableCell<T>) -> T
.mq_dequeue<T>(reusableHeader: MQReusableView<T>) -> T
.mq_dequeue<T>(reusableFooter: MQReusableView<T>) -> T
```

复用方法, 后续可能会加入注册

参考[MQCollectionView](../../MQ_Class.md)

# CGRect

```
.init(mq_size: CGSize)
```

等价于 `.init(origin: .zero, size: mq_size)`