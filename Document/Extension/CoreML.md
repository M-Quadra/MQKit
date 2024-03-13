# CoreML 相关扩展

方便移植部署与测试



## torch.randn

```swift
static func randn(
    shape: [NSNumber], dataType: MLMultiArrayDataType = .float32,
    scale: Double = 1
) throws -> MLMultiArray
```



## torch.mean

```swift
var mean: Double { get }
```



## torch.var

```swift
var variance: Double { get }
```

