//
//  UICollectionViewCompositionalLayout+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/10/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension UICollectionViewCompositionalLayout {
    
    static func sectionProvider(_ provider: @escaping (_ idx: Int, _ env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection) -> Self {
        self.init(sectionProvider: provider)
    }
}
