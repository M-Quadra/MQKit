# MQCollectionView

```
.whenHitTest(whenHitTest: hitTestClosure?)
```

为了更方便地写卡片滑动，延伸出了控制`hitTest`的闭包

神™的swift不能自动补全闭包，没办法，改成func了

```
.mq_dequeue<T>(reusableCell: MQReusableCell<T>) -> T
.mq_dequeue<T>(reusableHeader: MQReusableView<T>) -> T
.mq_dequeue<T>(reusableFooter: MQReusableView<T>) -> T
```

由于`delegate`默认补全的是`UICollectionView`, 所以直接放到`UICollectionView`扩展里

使用`MQCollectionView`时内部使用Set判断, 自动注册

支持范型返回值

CollectionView控件复用, 由于swift的迷の泛型传递，目前只能借用struct解决

后续考虑扩展到其他地方, 或者直接进行更进一步的封装

```
.superHitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?
```

为了在实现`whenHitTest`后依然能在外部访问原`hitTest`

```
.mq_dequeue<T: UITableViewCell>(reusableCell: MQReusableCell<T>) -> T
.mq_dequeue<T: UIView>(reusableHeaderFooter: MQReusableView<T>) -> T?
```

与`MQCollectionView`相同的注册与复用机制, 由于泛型问题需要使用结构体包装, HeaderFooter的返回值与`.dequeueReusableHeaderFooterView`保持一致, 使用可选值


