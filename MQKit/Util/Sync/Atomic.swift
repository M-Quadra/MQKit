//
//  Atomic.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/23.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

@available(iOS 13, *)
actor Atomic {
    
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
    
    func compareAndSwap(old: Int, new: Int) -> Bool {
        if self.value != old { return false }
        self.value = new
        return true
    }
    
    func add(_ delta: Int) -> Int {
        self.value += delta
        return self.value
    }
}
