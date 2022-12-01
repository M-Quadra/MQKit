# NSCollectionLayout 相关扩展



## NSCollectionLayoutBoundarySupplementaryItem

```swift
public static func header(layoutSize: NSCollectionLayoutSize) -> Self
public static func footer(layoutSize: NSCollectionLayoutSize) -> Self
```

快速创建header/footer



## NSCollectionLayoutDecorationItem

```swift
public static func background(view: UICollectionReusableView.Type) -> Self
```

等效`background(elementKind: className)`



## NSCollectionLayoutGroup

```swift
public var section: NSCollectionLayoutSection { get }
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

