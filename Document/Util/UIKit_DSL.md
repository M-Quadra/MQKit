# UIKit DSL

妄图减少重复代码, 参照[SnapKit](https://github.com/SnapKit/SnapKit)瞎糊弄一些方法

属性设置上有许多重复方法, 当然大部分都是靠Copilot生成的



## CALayer 相关

```swift
public func dsl<T: CALayer>(
    for klass: T.Type = T.self,
    closure: (_ make: CALayerDSL<T>) -> Void
) -> T

public func dsl<T: CALayer>(
    for object: T,
    closure: (_ make: CALayerDSL<T>) -> Void
) -> T
```

入口如上, 分别对应类型与对象



大致用法如下

```
fileprivate lazy var resetButton: UIButton = dsl { make in
    make.backgroundColor(.darkGray)
        .setTitle("Reset", for: .normal)
        .addAction(handler: { [weak self] act in
            self?.drawView.reset()
        }, for: .touchUpInside)
}
```



## Dictionary 相关

```swift
public func dsl<Key: Hashable, Value>(
    for dic: Dictionary<Key, Value> = [:],
    closure: (_ make: DictionaryDSL<Key, Value>) -> Void
) -> Dictionary<Key, Value>
```

入口如上, 目前主要用来提供富文本属性强类型

看着不够优雅, 后续可能移除
