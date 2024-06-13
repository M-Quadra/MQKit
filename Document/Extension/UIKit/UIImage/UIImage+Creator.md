# UIImage+Creator 构造相关


```swift
UIImage.render(
    size: CGSize,
    opaque: Bool = false,
    scale: CGFloat = UIScreen.main.scale,
    closure: (_ ctx: CGContext) -> ()
) -> UIImage
```

图片绘制上下文



```swift
UIColor.layer(
    _ layer: CALayer,
    size: CGSize? = nil,
    opaque: Bool = false,
    scale: CGFloat = UIScreen.main.scale
) -> UIImage
```

CALayer -> UIImage



```swift
UIColor.color(
    _ color: UIColor,
    size: CGSize = CGSize(1),
    scale: CGFloat = UIScreen.main.scale
) -> UIImage
```

绘制纯色图片



## 动态UIImage

```swift
@available(iOS 13.0, *)
static func dynamic(any: consuming UIImage, dark: consuming UIImage) -> UIImage
```

配合深色模式