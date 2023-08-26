//
//  NSCollectionLayoutSection+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutSection {
    
    func visibleItemsInvalidationHandler(_ handler: @escaping (_ items: [NSCollectionLayoutVisibleItem], _ offset: CGPoint, _ env: NSCollectionLayoutEnvironment) -> Void) -> Self {
        self.visibleItemsInvalidationHandler = handler
        return self
    }
}
