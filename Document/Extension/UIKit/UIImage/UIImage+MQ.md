# UIImage+MQ 扩展方法



## 取平均色


```swift
var averageColor: UIColor { get }
```



## 切圆角

```swift
func corner(radius: CGFloat, corners: UIRectCorner = .allCorners) -> UIImage
```



## 转像素

```swift
/// [y][x][RR, GG, BB, AA]
func pixelRGBA() -> [[[UInt8]]]?
```

实现太丑, 考虑弃用



## 是否不存在alpha通道

```swift
var opaque: Bool { get }
```



## 旋转

```
.image(orientation: Orientation) -> UIImage
```



## Resize

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



## 染色保持形状

```swift
func tint(color: consuming UIColor) -> UIImage?
```



## 染色保持纹理

```swift
func blend(color: consuming UIColor) -> UIImage?
```



