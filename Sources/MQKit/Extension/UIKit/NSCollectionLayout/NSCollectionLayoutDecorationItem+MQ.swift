//
//  NSCollectionLayoutDecorationItem+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/10/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutDecorationItem {
    
    static func background(view: UICollectionReusableView.Type) -> Self {
        let kind = NSStringFromClass(view)
        return Self.background(elementKind: kind)
    }
}
