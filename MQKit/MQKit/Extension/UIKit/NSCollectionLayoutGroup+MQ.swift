//
//  NSCollectionLayoutGroup+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/20.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension NSCollectionLayoutGroup {
    
    var section: NSCollectionLayoutSection {
        NSCollectionLayoutSection(group: self)
    }
}
