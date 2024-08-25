//
//  Semaphore.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/23.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

@available(iOS 13, *)
struct Semaphore: @unchecked Sendable {
    
    let lifoCount = Atomic(0)
    let lifoChanel = Channel<Void>()
    
    let slowCount = Atomic(0)
    let slowChanel = Channel<Void>()
    
    let sem: Atomic
    init(_ sem: Int) {
        self.sem = Atomic(max(0, sem))
    }
    
    func acquire(isLIFO: Bool = false) async {
        if await self.sem.add(-1) >= 0 { return }
        
        if isLIFO {
            _ = await lifoCount.add(1)
            await self.lifoChanel.byPop()
        } else {
            _ = await self.slowCount.add(1)
            await self.slowChanel.byPop()
        }
    }
    
    func release() async {
        if await self.sem.add(1) < 0 { return }
        
        while true {
            let lifoCount = await self.lifoCount.value
            guard lifoCount > 0,
                  await self.sem.value >= 0,
                  await self.lifoCount.compareAndSwap(old: lifoCount, new: lifoCount-1)
            else { break }
            
            self.lifoChanel.push(())
        }
        
        while true {
            let slowCount = await self.slowCount.value
            guard slowCount > 0,
                  await self.sem.value >= 0,
                  await self.slowCount.compareAndSwap(old: slowCount, new: slowCount-1)
            else { break }
            
            self.slowChanel.push(())
        }
    }
}
