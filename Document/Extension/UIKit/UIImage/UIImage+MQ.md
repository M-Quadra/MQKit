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



```swift
enum MQResizingMode {
    case scaleToFill
    
    case scaleAspectFit
    
    case scaleAspectFill
    case scaleAspectFillTop
    case scaleAspectFillBottom
}

.resize(
    to size: CGSize,
    scale: CGFloat? = nil,
    model: UIImage.MQResizingMode = .scaleToFill
) -> UIImage
```

图片resize至目标大小, 可能存在透明填充

Mode感觉够用, 以后也许会更新