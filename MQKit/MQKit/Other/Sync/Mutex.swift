//
//  Mutex.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/21.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

fileprivate let mutexLocked: Int32 = 1

@available(iOS 13, *)
public class Mutex {
    
    let state = Atomic(0)
    
    public init() {}
}

// MARK: - Public
@available(iOS 13, *)
public extension Mutex {
    
    func lock() async {
        if await self.state.compareAndSwap(old: 0, new: 1) { return }
        
        for _ in 0..<4 {
            await Task.yield()
            if await self.state.compareAndSwap(old: 0, new: 1) { return }
        }
        
        var duration: UInt64 = 1
        while await !self.state.compareAndSwap(old: 0, new: 1) {
            duration = min(duration << 1, 1_000_000)
            try? await Task.sleep(nanoseconds: duration)
        }
    }
    
    func tryLock() async -> Bool {
        await self.state.compareAndSwap(old: 0, new: 1)
    }
    
    func unlock() async {
        while await !self.state.compareAndSwap(old: 1, new: 0) {
            await Task.yield()
        }
    }
}
