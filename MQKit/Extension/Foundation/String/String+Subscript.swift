//
//  String+Subscript.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/13.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension String {
    
    /// [st, ed)
    subscript (range: Range<Int>) -> Substring {
        let cnt = self.count
        var l = max(0, range.lowerBound), r = min(range.upperBound, self.count)
        if r <= 0 {
            l += cnt
            r += cnt
        }
        if !(0..<cnt ~= l) || !(1...cnt ~= r) { return "" }
        
        let st = self.index(self.startIndex, offsetBy: l)
        let ed = self.index(self.startIndex, offsetBy: r)
        return self[st..<ed]
    }
    
    /// [i]
    subscript (index: Int) -> Substring {
        return self[index..<(index+1)]
    }
    
    /// [st, ed]
    subscript (rang: ClosedRange<Int>) -> Substring {
        return self[rang.lowerBound..<(rang.upperBound+1)]
    }
    
    /// [st, +∞)
    subscript (rang: PartialRangeFrom<Int>) -> Substring {
        let ed = self.count
        let st = rang.lowerBound >= 0 ? rang.lowerBound : ed + rang.lowerBound
        return self[st..<ed]
    }

    /// [0, ed]
    subscript (rang: PartialRangeThrough<Int>) -> Substring {
        let ed = rang.upperBound >= 0 ? rang.upperBound : self.count + rang.upperBound
        return self[0..<(ed+1)]
    }

    /// [0, ed)
    subscript (rang: PartialRangeUpTo<Int>) -> Substring {
        let ed = rang.upperBound >= 0 ? rang.upperBound : self.count + rang.upperBound
        return self[0..<ed]
    }
}
