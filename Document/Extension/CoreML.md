# CoreML 相关扩展

限制太多，很是难受。为方便移植部署与测试糊了写东西。



## torch.randn

```swift
static func randn(
    shape: [NSNumber],
    scale: Double = 1,
    dataType: MLMultiArrayDataType = .float32
) throws -> MLMultiArray
```

若干年后最低兼容提升了，只保留MPS实现的版本？



## torch.mean

```swift
var mean: Double { get }
```



## torch.var

```swift
var variance: Double { get }
```

