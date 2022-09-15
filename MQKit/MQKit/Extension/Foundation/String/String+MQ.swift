//
//  String+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/14.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension String {
    
    fileprivate static var _cachedCount = -1
    var cachedCount: Int {
        get {
            var cnt = objc_getAssociatedObject(self, &String._cachedCount) as? Int ?? -1
            if cnt < 0 {
                cnt = self.count
                objc_setAssociatedObject(self, &String._cachedCount, cnt, .OBJC_ASSOCIATION_ASSIGN)
            }
            return cnt
        }
    }
}
