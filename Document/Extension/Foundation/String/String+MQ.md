# String+MQ 其他

```swift
.cachedCount
```

由于String中的count内部没有使用缓存, 在大量重复使用的情况下会引起十分严重的性能问题, 因此对count加了个缓存