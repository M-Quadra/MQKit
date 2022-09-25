//
//  UICollectionViewDiffableDataSource+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension UICollectionViewDiffableDataSource {
    
    func supplementaryViewProvider(_ setter: @escaping UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>.SupplementaryViewProvider) {
        self.supplementaryViewProvider = setter
    }
    
    var emptySnapshot: NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType> {
        return NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>()
    }
}
