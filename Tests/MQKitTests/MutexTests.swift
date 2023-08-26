//
//  MutexTests.swift
//  
//
//  Created by m_quadra on 2023/8/26.
//

import Foundation
import XCTest
@testable import MQKit

@available(iOS 16, *)
final class MutexTests: XCTestCase {
    
    let loopCnt = 10_0000
    
    func test() async throws {
        let m = Mutex()
        
        await m.lock()
        if m.tryLock() {
            assertionFailure("TryLock succeeded with mutex locked")
        }
        m.unlock()
        if !m.tryLock() {
            assertionFailure("TryLock failed with mutex unlocked")
        }
        m.unlock()
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<10 {
                group.addTask {
                    await hammerMutex(m: m, loops: self.loopCnt)
                }
            }
        }
    }
    
    func testFairness() async {
        let st = Date()
        
        let m = Mutex()
        let t = Task {
            while true {
                await m.lock()
                try? await Task.sleep(for: .milliseconds(100))
                m.unlock()
                try Task.checkCancellation()
            }
        }
        defer { t.cancel() }
        
        await Task {
            for _ in 0..<10 {
                try? await Task.sleep(for: .microseconds(100))
                await m.lock()
                m.unlock()
            }
        }.value
        
        let duration = Date().timeIntervalSince(st)
        XCTAssertLessThan(duration, 10, "can't acquire Mutex in 10 seconds")
    }
    
    @MainActor
    func testAsyncSafe() async {
        let m = Mutex()
        for _ in 0..<self.loopCnt {
            await m.lock()
            Task { @MainActor in
                m.unlock()
            }
        }
        await m.lock()
        m.unlock()
    }
    
    func testUncontended() async {
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<self.loopCnt {
                group.addTask {
                    let m = Mutex()
                    await m.lock()
                    m.unlock()
                }
            }
            
            await group.waitForAll()
        }
    }
    
    func testP0() async {
        let m = Mutex()
        class Acc { var v = 0 }
        let acc0 = Acc(), acc1 = Acc()
        
        await withTaskGroup(of: Void.self, body: { group in
            for _ in 0..<4 {
                group.addTask {
                    var arr = Array(repeating: 0, count: 1 << 6)
                    for i in 0..<self.loopCnt {
                        await m.lock()
                        if i%4 == 0 {
                            for i in arr.indices { arr[i] += 1 }
                        } else {
                            acc0.v -= 100
                            acc1.v += 100
                        }
                        m.unlock()
                    }
                }
            }
            
            await group.waitForAll()
        })
    }
}

@available(iOS 16, *)
fileprivate func hammerMutex(m: Mutex, loops: Int) async {
    for i in 0..<loops {
        if i%3 == 0 {
            if m.tryLock() {
                m.unlock()
            }
            continue
        }
        await m.lock()
        m.unlock()
    }
}
