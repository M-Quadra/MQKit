//
//  String+MQSub.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String {
    
    fileprivate static var mqCount = -1
    public var mq_count: Int {
        get {
            var cnt = objc_getAssociatedObject(self, &String.mqCount) as? Int ?? -1
            if cnt < 0 {
                cnt = self.count
                objc_setAssociatedObject(self, &String.mqCount, cnt, .OBJC_ASSOCIATION_ASSIGN)
            }
            return cnt
        }
    }
    
    /// [st, ed), st..<ed
    public func mq_substring(with range: Range<Int>) -> String {
        let stIdx = range.startIndex
        let edIdx = stIdx < 0 ? min(range.endIndex, 0) : range.endIndex
        let rangeAry = [stIdx, edIdx].map {
            min(stIdx < 0 ? max(0, self.mq_count + $0) : $0, self.mq_count)
        }
        guard rangeAry[0] < rangeAry[1] else {
            return ""
        }
        
        let st = self.index(self.startIndex, offsetBy: rangeAry[0])
        let ed = self.index(self.startIndex, offsetBy: rangeAry[1])
        return String(self[st..<ed])
    }
    
    /// [st, ed], st...ed
    public func mq_substring(with range: ClosedRange<Int>) -> String {
        let st = range.lowerBound
        let ed = range.upperBound + 1
        return self.mq_substring(with: st..<ed)
    }
    
    /// [0, ed], ...ed
    public func mq_substring(with range: PartialRangeThrough<Int>) -> String {
        let upperBound = range.upperBound
        let ed = upperBound < 0 ? max(0, self.mq_count + upperBound) : min(upperBound, self.mq_count)
        return self.mq_substring(with: 0...ed)
    }
    
    /// [0, ed), ..<ed
    public func mq_substring(with range: PartialRangeUpTo<Int>) -> String {
        let upperBound = range.upperBound
        let ed = upperBound < 0 ? max(0, self.mq_count + upperBound) : min(upperBound, self.mq_count)
        return self.mq_substring(with: 0..<ed)
    }
    
    /// [st, +∞), st...
    public func mq_substring(with range: PartialRangeFrom<Int>) -> String {
        let lowerBound = range.lowerBound
        let st = lowerBound < 0 ? max(0, self.mq_count + lowerBound) : min(lowerBound, self.mq_count)
        return self.mq_substring(with: min(st, self.mq_count - 1)..<self.mq_count)
    }
    
    /// [.lowerBound, .upperBound)
    public func mq_substring(with range: NSRange) -> String {
        return self.mq_substring(with: range.lowerBound..<range.upperBound)
    }
    
    /// [st, ed), st..<ed
    public func mq_substring(with range: CFRange) -> String {
        let st = range.location
        let ed = range.location + range.length
        return self.mq_substring(with: st..<ed)
    }
    
    public func mq_substring(with index: Int) -> String {
        return self.mq_substring(with: index..<index+1)
    }
}
