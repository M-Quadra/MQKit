//
//  UICollectionViewFlowLayout+DSL.swift
//
//
//  Created by m_quadra on 2024/5/1.
//

import UIKit

@MainActor public struct UICollectionViewFlowLayoutDSL<T: UICollectionViewFlowLayout> {
    let object: T
    init(_ object: T) {
        self.object = object
    }
}

@MainActor public func dsl<T: UICollectionViewFlowLayout>(
    for layout: T = T(),
    closure: (_ make: UICollectionViewFlowLayoutDSL<T>) -> Void
) -> T {
    closure(UICollectionViewFlowLayoutDSL<T>(layout))
    return layout
}

public extension UICollectionViewFlowLayoutDSL {
    
    @discardableResult
    func minimumLineSpacing(_ spacing: CGFloat) -> Self {
        object.minimumLineSpacing = spacing
        return self
    }

    @discardableResult
    func minimumInteritemSpacing(_ spacing: CGFloat) -> Self {
        object.minimumInteritemSpacing = spacing
        return self
    }

    @discardableResult
    func itemSize(_ size: CGSize) -> Self {
        object.itemSize = size
        return self
    }

    @discardableResult
    func estimatedItemSize(_ size: CGSize) -> Self {
        object.estimatedItemSize = size
        return self
    }

    @discardableResult
    func scrollDirection(_ direction: UICollectionView.ScrollDirection) -> Self {
        object.scrollDirection = direction
        return self
    }

    @discardableResult
    func headerReferenceSize(_ size: CGSize) -> Self {
        object.headerReferenceSize = size
        return self
    }

    @discardableResult
    func footerReferenceSize(_ size: CGSize) -> Self {
        object.footerReferenceSize = size
        return self
    }

    @discardableResult
    func sectionInset(_ inset: UIEdgeInsets) -> Self {
        object.sectionInset = inset
        return self
    }
}
