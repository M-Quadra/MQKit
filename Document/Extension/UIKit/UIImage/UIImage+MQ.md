# UIImage+MQ 通用方法


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

```
var mq_opaque: Bool { get }
```

是否不存在alpha通道

```
.mq_image(orientation: Orientation) -> UIImage?
```

图片旋转