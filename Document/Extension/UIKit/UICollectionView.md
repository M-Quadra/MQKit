# UICollectionView 相关扩展



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



## UICollectionViewCompositionalLayout

```swift
static func sectionProvider(_ provider: @escaping (_ idx: Int, _ env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection) -> Self
```

等效`init(sectionProvider: provider)`, 闭包补全支持



## UICollectionViewDiffableDataSource

```swift
.supplementaryViewProvider(_ setter: @escaping UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>.SupplementaryViewProvider)
```

等效`.supplementaryViewProvider`, 闭包补全支持



```swift
.emptySnapshot: NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>
```

等效空Snapshot创建, 原始方法太长, 直接替换



## UICollectionViewLayout

```swift
func register(decorationView view: UICollectionReusableView.Type)
```

view注册