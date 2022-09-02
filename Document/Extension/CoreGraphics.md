# CoreGraphics 相关扩展

## CGColor

同步`UIColor`的使用体验



```swift
CGColor.random
```

随机颜色

```swift
CGColor.hex(_ hex: String, alpha: CGFloat = 1) -> CGColor
```

`#RRGGBB`转CGColor

```swift
CGColor.black
       .darkGray
       .lightGray
       .white
       .gray
       .red
       .green
       .blue
       .cyan
       .yellow
       .magenta
       .orange
       .purple
       .brown
       .clear
```

同步`UIColor`

## CGPoint

```swift
CGPoint(_ xy: {CGFloat | Int | Double})
```

创建xy相同的Point

```swift
CGPoint {+|-}   CGPoint
CGPoint {+=|-=} CGPoint
CGPoint {+|-|*|/}     CGFloat
CGPoint {+=|-=|*=|/=} CGFloat
```

运算符重载

## CGRect

```swift
.init(_ size: CGSize)
```

等价 `.init(origin: .zero, size: size)`

```swift
CGRect {+|-} CGPoint
CGRect {+=|-=} CGPoint
```

运算符重载

## CGSize

```swift
CGSize.max
```

取CGFloat上限

```swift
CGSize.init(_ edge: {CGFloat|Int|Double})
```

创建宽高相同的Size

```swift
.area
```

面积

```swift
CGSize {+|-|*|/} CGFloat
CGSize {+=|-=|*=|/=} CGFloat
```

运算符重载

