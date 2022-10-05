# UIKit DSL

妄图减少重复代码, 参照[SnapKit](https://github.com/SnapKit/SnapKit)瞎糊弄一些方法

属性设置上有许多重复方法, 当然大部分都是靠Copilot生成的



```swift
public func dsl<T: NSObject>(for klass: T.Type = T.self, closure: (_ make: 
public func dsl<T: NSObject>(for object: T, closure: (_ make: ObjectDSL<T>) -> Void) -> T
```

主要入口如上, 分别对应类型与对象



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

