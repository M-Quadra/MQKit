//
//  NSRegularExpression+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/12/23.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    
    public func mq_firstMatch(in string: String) -> NSTextCheckingResult? {
        return self.firstMatch(in: string, range: NSRange(location: 0, length: string.utf16.count))
    }
    
    public func mq_matches(in string: String) -> [NSTextCheckingResult] {
        return self.matches(in: string, range: NSRange(location: 0, length: string.utf16.count))
    }
    
}
