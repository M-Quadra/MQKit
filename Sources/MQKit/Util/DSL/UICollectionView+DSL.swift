//
//  UICollectionView+DSL.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/30.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIViewDSL where T: UICollectionView {
    
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate?) -> Self {
        self.object.delegate = delegate
        return self
    }

    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self {
        self.object.dataSource = dataSource
        return self
    }

    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self {
        self.object.prefetchDataSource = prefetchDataSource
        return self
    }

    @discardableResult
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self {
        self.object.dragDelegate = dragDelegate
        return self
    }

    @discardableResult
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self {
        self.object.dropDelegate = dropDelegate
        return self
    }

    @discardableResult
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self {
        self.object.dragInteractionEnabled = dragInteractionEnabled
        return self
    }

    @discardableResult
    func reorderingCadence(_ reorderingCadence: UICollectionView.ReorderingCadence) -> Self {
        self.object.reorderingCadence = reorderingCadence
        return self
    }

    @available(iOS 16.0, *) @discardableResult
    func selfSizingInvalidation(_ selfSizingInvalidation: UICollectionView.SelfSizingInvalidation) -> Self {
        self.object.selfSizingInvalidation = selfSizingInvalidation
        return self
    }

    @discardableResult
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.object.backgroundView = backgroundView
        return self
    }

    @discardableResult
    func allowsSelection(_ allowsSelection: Bool) -> Self {
        self.object.allowsSelection = allowsSelection
        return self
    }

    @discardableResult
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self {
        self.object.allowsMultipleSelection = allowsMultipleSelection
        return self
    }

    @discardableResult
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath: Bool) -> Self {
        self.object.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
    
    @available(iOS 14.0, *) @discardableResult
    func isEditing(_ isEditing: Bool) -> Self {
        self.object.isEditing = isEditing
        return self
    }

    @available(iOS 14.0, *) @discardableResult
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing: Bool) -> Self {
        self.object.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        return self
    }
    
    @available(iOS 14.0, *) @discardableResult
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing: Bool) -> Self {
        self.object.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        return self
    }
}

// MARK: - MQ
public extension UIViewDSL where T: UICollectionView {
    
    @discardableResult
    func register(cells: [UICollectionViewCell.Type]) -> Self {
        self.object.register(cells: cells)
        return self
    }
    
    @discardableResult
    func register(header: UICollectionReusableView.Type) -> Self {
        self.object.register(header: header)
        return self
    }
    
    @discardableResult
    func register(footer: UICollectionReusableView.Type) -> Self {
        self.object.register(footer: footer)
        return self
    }
}
