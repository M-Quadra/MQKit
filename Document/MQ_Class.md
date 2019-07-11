# MQCollectionView

```
.whenHitTest(whenHitTest: hitTestClosure?)
```

为了更方便地写卡片滑动，延伸出了控制`hitTest`的闭包

神™的swift不能自动补全闭包，没办法，改成func了

```
.dequeue<T>(reusableCell: MQReusableCell<T>) -> T
.dequeue<T>(reusableHeader: MQReusableView<T>) -> T
.dequeue<T>(reusableFooter: MQReusableView<T>) -> T
```

内部使用Set判断, 自动注册, 支持范型返回值

CollectionView控件复用, 由于swift的迷の范型传递，目前直接借用struct解决

后续考虑扩展到其他地方, 或者直接进行更进一步的封装


# MQTableView


```
.whenHitTest(whenHitTest: hitTestClosure?)
```

为了更方便地写卡片滑动，延伸出了控制`hitTest`的闭包

神™的swift不能自动补全闭包，没办法，改成func了