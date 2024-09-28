# CoreML 相关扩展

还在挣扎推理辅助工具，完成后移除这部分扩展。



## torch.randn

```swift
@available(iOS 16.0, *)
public static func randnFP16(shape: consuming [NSNumber]) throws -> MLMultiArray

public static func randnFP32(shape: consuming [NSNumber]) throws -> MLMultiArray
```

出于实用考虑，仅保留FP16与FP32实现。



## torch.mean

```swift
var mean: Double { get }
```



## torch.var

```swift
var variance: Double { get }
```

