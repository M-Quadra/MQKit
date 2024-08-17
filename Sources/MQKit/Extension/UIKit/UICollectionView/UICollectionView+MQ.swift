//
//  UICollectionView+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

// MARK: - Creator
public extension UICollectionView {
    
    convenience init(layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
    }
}

@MainActor fileprivate extension String {
    static let header = UICollectionView.elementKindSectionHeader
    static let footer = UICollectionView.elementKindSectionFooter
}

// MARK: - Register
public extension UICollectionView {
    
    func register(cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            let identifier = NSStringFromClass(cell)
            self.register(cell, forCellWithReuseIdentifier: identifier)
        }
    }
    
    func register(header: UICollectionReusableView.Type) {
        let identifier = NSStringFromClass(header)
        self.register(header, forSupplementaryViewOfKind: .header, withReuseIdentifier: identifier)
    }
    
    func register(footer: UICollectionReusableView.Type) {
        let identifier = NSStringFromClass(footer)
        self.register(footer, forSupplementaryViewOfKind: .footer, withReuseIdentifier: identifier)
    }
}

// MARK: - Dequeue
public extension UICollectionView {
    
    func dequeue<T: UICollectionViewCell>(cell: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(cell)
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    func dequeue<T: UICollectionReusableView>(header: T.Type, for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(header)
        return self.dequeueReusableSupplementaryView(ofKind: .header, withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    func dequeue<T: UICollectionReusableView>(footer: T.Type, for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(footer)
        return self.dequeueReusableSupplementaryView(ofKind: .footer, withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
