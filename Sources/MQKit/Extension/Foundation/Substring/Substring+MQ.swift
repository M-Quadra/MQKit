//
//  Substring+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/13.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension Substring {
    
    var stringValue: String {
        return String(self)
    }
    
    var nsRange: NSRange {
        return NSRange(location: self.startIndex.utf16Offset(in: self.base), length: self.utf16.count)
    }
}
