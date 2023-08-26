//
//  Mutex.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

@available(iOS 13, *)
public class Mutex {
    
    fileprivate var state: Int32 = 0
    fileprivate let lock = NSLock() // 懒
}

// MARK: - Public
@available(iOS 13, *)
public extension Mutex {
    
    func lock() async {
        if OSAtomicCompareAndSwap32(0, 1, &self.state) { return }
        await Task.yield()
        for _ in 0..<11 {
            if OSAtomicCompareAndSwap32(0, 1, &self.state) { return }
        }
        
        var isLock = false
        for _ in 0..<61 {
            self.lock.withLock {
                if OSAtomicCompareAndSwap32(0, 1, &self.state) {
                    isLock = true
                    return
                }
            }
            if isLock { return }
        }
        
        while !OSAtomicCompareAndSwap32(0, 1, &self.state) {}
    }
    
    func unlock() {
        while !OSAtomicCompareAndSwap32(1, 0, &self.state) {}
    }
    
    func tryLock() -> Bool {
        return OSAtomicCompareAndSwap32(0, 1, &self.state)
    }
}
