//
//  String+MQRegularExpression.swift
//  MQKit
//
//  Created by M_Quadra on 2020/7/29.
//  Copyright © 2020 M_noAria. All rights reserved.
//

import Foundation

extension String {
    
    public func mq_firstMatch(in exp: NSRegularExpression) -> String? {
        guard let result = exp.mq_firstMatch(in: self) else {
            return nil
        }
        return NSString(string: self).substring(with: result.range)
    }
    
    public func mq_firstMatchResult(in exp: NSRegularExpression) -> NSTextCheckingResult? {
        return exp.mq_firstMatch(in: self)
    }
    
    public func mq_matches(in exp: NSRegularExpression) -> [NSTextCheckingResult] {
        return exp.mq_matches(in: self)
    }
}
