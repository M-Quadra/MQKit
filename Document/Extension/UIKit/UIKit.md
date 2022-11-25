# UIKit 相关扩展

- [UICollectionView 相关](./UICollectionView.md)



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

```swift
func openSettings(
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
    completionHandler completion: ((Bool) -> Void)? = nil
)
```

设置页跳转




## UIImage

1. [通用方法](UIImage/UIImage+MQ.md)
2. [构造相关](./UIImage/UIImage+Creator.md)
3. [Metal相关](UIImage/UIImage+MQMetal.md)

## UIDevice

1. [硬件相关信息](./UIDevice/UIDevice+MQHardware.md)
2. [软件相关信息](./UIDevice/UIDevice+MQSoftware.md)
3. [设备判断](./UIDevice/设备判断.md)



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



## NSCollectionLayoutDecorationItem

```swift
static func background(view: UICollectionReusableView.Type) -> Self
```

等效`background(elementKind: className)`



## UITextField

```
.markedText
```

获取`markedTextRange`对应`Text`, 如中文输入选词

```
.selectedText
```

获取`selectedTextRange`对应`Text`



## CGFloat

```swift
public static var max: CGFloat { get }
```

等效`.greatestFiniteMagnitude`



## NSCollectionLayoutSection

```swift
func visibleItemsInvalidationHandler(_ handler: @escaping (_ items: [NSCollectionLayoutVisibleItem], _ offset: CGPoint, _ env: NSCollectionLayoutEnvironment) -> Void) -> Self
```

等效`.visibleItemsInvalidationHandler`, 包装func实现闭包补全



## UIEdgeInsets

```swift
public static func top(_ top: CGFloat) -> UIEdgeInsets
public static func left(_ left: CGFloat) -> UIEdgeInsets
public static func bottom(_ bottom: CGFloat) -> UIEdgeInsets
public static func right(_ right: CGFloat) -> UIEdgeInsets
public static func horizontal(_ horizontal: CGFloat) -> UIEdgeInsets
public static func vertical(_ vertical: CGFloat) -> UIEdgeInsets
public static func all(_ all: CGFloat) -> UIEdgeInsets
```

快速创建

