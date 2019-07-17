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

# MQTableView

```
.whenHitTest(whenHitTest: hitTestClosure?)
```

为了更方便地写卡片滑动，延伸出了控制`hitTest`的闭包

神™的swift不能自动补全闭包，没办法，改成func了

```
.superHitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?
```

为了在实现`whenHitTest`后依然能在外部访问原`hitTest`

# MQHorizontalPagingView

固定cell大小的横向Paging滚动CollectionView

做了点击支持, 手势暂时没管

为了外部调用看着爽, 使用struct传递泛型

后续可能会加入更多支持

```
.init(frame: CGRect, info: ViewInfo)
```

初始化方法, 确定常量信息

```
ViewInfo.init(edgeSpacing:CGFloat, cellSpacing: CGFloat, cellWidth: CGFloat, pageWidth: CGFloat)
```
- edgeSpacing 左右边距
- cellSpacing cell间距
- cellWidth cell宽
- pageWidth 翻页距离(后面可能会改为变量)

```
.dequeueCell<T: UICollectionViewCell>(_ closure: @escaping dequeueCellClosure<T>)
```

cell复用与willDisplay设置, 泛型约束UICollectionViewCell子类

```
MQHorizontalPagingView.Cell
.cell()
.willDisplay(_ closure: @escaping emptyClosure) -> Cell
```

不需要设置willDisplay直接`cell()`, 虽然出现得不多但依然写上了\_(:з」∠)_

```
didSelectCell(_ closure: @escaping didSelectCellClosure)
```

didSelect回调, 由于swift不能自动补全闭包, 所以改成函数

# MQKeychain

```
static func set(key: String, value: Data?)
static func set(key: String, value: String)
```

设置key, value, String默认使用`.utf8`

若为nil则删除

```
static func search(key: String) -> Data?
static func search(stringKey: String) -> String
```

获取对应key的值

```
static func clear()
```

清空Keychain