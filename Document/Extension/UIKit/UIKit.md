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
UIColor.random
```

获取一个随机颜色

```swift
UIColor.init(hex: String, alpha: CGFloat = 1)
UIColor.hex(_ hex: String, alpha: CGFloat = 1) -> UIColor
```

通过HEX (\#RRGGBB) 创建颜色

```swift
UIColor.init(mq_backgroundColor: UIColor, frontColor: UIColor)
```

混色

```
.inverse
```

计算反色

```swift
.getRed
.getGreen
.getBlue
.getAlpha
```

获取RGBA

```
.mtlClearColor
```

获取对应的`MTLClearColor`

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

1. [通用方法](UIImage/UIImage+MQ.md)
2. [Metal相关](UIImage/UIImage+MQMetal.md)

# UIDevice

1. [硬件相关信息](./UIDevice/UIDevice+MQHardware.md)
2. [软件相关信息](./UIDevice/UIDevice+MQSoftware.md)
3. [设备判断](./UIDevice/设备判断.md)

# UICollectionView

```
.mq_dequeue<T>(reusableCell: MQReusableCell<T>) -> T
.mq_dequeue<T>(reusableHeader: MQReusableView<T>) -> T
.mq_dequeue<T>(reusableFooter: MQReusableView<T>) -> T
```

复用方法, 后续可能会加入注册

参考[MQCollectionView](../../MQ_Class.md)
