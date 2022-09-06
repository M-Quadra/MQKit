# UIImage+MQ 通用方法


```
averageColor
```

获取图片平均色



```
.corner(radius: CGFloat, corners: UIRectCorner = .allCorners) -> UIImage
```

图片切圆角



```
.pixelRGBA() -> [[[UInt8]]]?
```

获取像素



```
.opaque: Bool { get }
```

是否不存在alpha通道



```
.image(orientation: Orientation) -> UIImage
```

图片旋转