//
//  String+MQSub.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String {
    
    /// [st, ed),
    func mq_substring(with range : Range<Int>) -> String {
        let stIdx = range.startIndex
        let edIdx = stIdx < 0 ? min(range.endIndex, 0) : range.endIndex
        let rangeAry = [stIdx, edIdx].map {
            min(stIdx < 0 ? max(0, self.count + $0) : $0, self.count)
        }
        guard rangeAry[0] < rangeAry[1] else {
            return ""
        }
        
        let st = self.index(self.startIndex, offsetBy: rangeAry[0])
        let ed = self.index(self.startIndex, offsetBy: rangeAry[1])
        return String(self[st..<ed])
    }
    
    /// [st, ed]
    func mq_substring(with range : ClosedRange<Int>) -> String {
        let st = range.lowerBound
        let ed = range.upperBound + 1
        return self.mq_substring(with: st..<ed)
    }
}
