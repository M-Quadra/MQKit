//
//  NSDiffableDataSourceSnapshot+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension NSDiffableDataSourceSnapshot {
    mutating func deleteItems(inSection section: SectionIdentifierType) {
        let items = self.itemIdentifiers(inSection: section)
        self.deleteItems(items)
    }
    
    mutating func deleteItems(inSections sections: [SectionIdentifierType]) {
        for section in sections {
            self.deleteItems(inSection: section)
        }
    }
    
    mutating func appendIfNeeded(section: SectionIdentifierType) {
        if self.indexOfSection(section) != nil { return }
        self.appendSections([section])
    }
    
    mutating func appendIfNeeded(item: ItemIdentifierType, toSection section: SectionIdentifierType? = nil) {
        if self.indexOfItem(item) != nil { return }
        self.appendItems([item], toSection: section)
    }
}
