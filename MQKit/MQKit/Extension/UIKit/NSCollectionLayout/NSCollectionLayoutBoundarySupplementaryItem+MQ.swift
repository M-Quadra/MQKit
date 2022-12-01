//
//  NSCollectionLayoutBoundarySupplementaryItem+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/12/2.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutBoundarySupplementaryItem {
    
    static func header(layoutSize: NSCollectionLayoutSize) -> Self {
        return .init(
            layoutSize: layoutSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    static func footer(layoutSize: NSCollectionLayoutSize) -> Self {
        return .init(
            layoutSize: layoutSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
    }
}
