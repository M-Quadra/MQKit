# UIKit 相关扩展

## UIFont

```
.mq_allFontNames
```

获取系统支持的所有字体

```
.mq_localFontName(forPath: String) -> String
.mq_localFontName(forPath: URL) -> String
```

获取字体文件对应的`fontName`

## UIColor

```
UIColor.random
```

获取一个随机颜色

```swift
UIColor.init(hex: String, alpha: CGFloat = 1)
UIColor.hex(_ hex: String, alpha: CGFloat = 1) -> UIColor
```

通过HEX (\#RRGGBB) 创建颜色

```swift
UIColor.init(mq_backgroundColor: UIColor, frontColor: UIColor)
```

混色

```
.inverse
```

计算反色

```swift
.getRed
.getGreen
.getBlue
.getAlpha
```

获取RGBA

```
.mtlClearColor
```

获取对应的`MTLClearColor`

## UIView

```swift
.top
.left
.bottom
.right
.width
.height
.centerX
.centerY
.origin
.size
```

修改对应UIView属性



```
.parentViewController
```

寻找UIView的上层VC



```swift
.setShadow(offset: CGSize, effect: CGFloat, color: UIColor)
```

设置阴影，使用贴近标注的命名




```swift
.shadowPathToFit()
```

根据bounds创建shadowPath



```swift
.addSubviews(_ views: [UIView]) -> Self
```

批量添加子视图



## 数值

```
Double.mq_radian(angle: )
CGFloat.mq_radian(angle: )
```

角度值转弧度值

## UIApplication

1. [常用三方 URL Scheme](./UIApplication/UIApplication+MQThird.md)


## UIImage

1. [通用方法](UIImage/UIImage+MQ.md)
2. [构造相关](./UIImage/UIImage+Creator.md)
3. [Metal相关](UIImage/UIImage+MQMetal.md)

## UIDevice

1. [硬件相关信息](./UIDevice/UIDevice+MQHardware.md)
2. [软件相关信息](./UIDevice/UIDevice+MQSoftware.md)
3. [设备判断](./UIDevice/设备判断.md)

## UICollectionView

```swift
UICollectionView(layout: UICollectionViewLayout)
```

等效`init(frame: .zero, collectionViewLayout: layout)`



```swift
.register(cells: [UICollectionViewCell.Type])
```

批量注册Cell



```swift
.register(header: UICollectionReusableView.Type)
```

注册header, 使用`UICollectionElementKindSectionHeader`



```swift
.register(footer: UICollectionReusableView.Type)
```

注册footer, 使用`UICollectionElementKindSectionFooter`



```
.dequeue<T: UICollectionViewCell>(cell: T.Type = T.self, for indexPath: IndexPath) -> T
```

复用Cell



```
.dequeue<T: UICollectionReusableView>(header: T.Type, for indexPath: IndexPath) -> T
```

复用header, 使用`UICollectionElementKindSectionHeader`



```
.dequeue<T: UICollectionReusableView>(footer: T.Type, for indexPath: IndexPath) -> T
```

复用footer, 使用`UICollectionElementKindSectionFooter`



## NSDiffableDataSourceSnapshot

```swift
.deleteItems(inSection section: SectionIdentifierType)
.deleteItems(inSections sections: [SectionIdentifierType])
```

清空section下的item



## NSCollectionLayoutGroup

```swift
.section: NSCollectionLayoutSection
```

等效`NSCollectionLayoutSection(group: group)`, 从头开始创建section太麻烦了



## UICollectionViewDiffableDataSource

```swift
.supplementaryViewProvider(_ setter: @escaping UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>.SupplementaryViewProvider)
```

等效`.supplementaryViewProvider`, 套func手动开启闭包补全



```swift
.emptySnapshot: NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>
```

等效空Snapshot创建, 原始方法太长, 直接替换



## NSCollectionLayoutSize

```swift
static var fill: Self
```

等效`widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)`



```swift
static func width(_ width: NSCollectionLayoutDimension) -> Self
```

等效`widthDimension: width, heightDimension: .fractionalHeight(1)`



```swift
static func height(_ height: NSCollectionLayoutDimension) -> Self
```

等效`widthDimension: .fractionalWidth(1), heightDimension: height`



## NSDirectionalEdgeInsets

```swift
static func top(_ top: CGFloat) -> NSDirectionalEdgeInsets
static func leading(_ leading: CGFloat) -> NSDirectionalEdgeInsets
static func bottom(_ bottom: CGFloat) -> NSDirectionalEdgeInsets
static func trailing(_ trailing: CGFloat) -> NSDirectionalEdgeInsets
static func horizontal(_ edge: CGFloat) -> NSDirectionalEdgeInsets
static func horizontal(leading: CGFloat, trailing: CGFloat) -> NSDirectionalEdgeInsets
static func vertical(_ edge: CGFloat) -> NSDirectionalEdgeInsets
static func vertical(top: CGFloat, bottom: CGFloat) -> NSDirectionalEdgeInsets
static func all(_ edge: CGFloat) -> NSDirectionalEdgeInsets
```

边距快速创建
