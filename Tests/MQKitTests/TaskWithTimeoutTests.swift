//
//  TaskWithTimeoutTests.swift
//  
//
//  Created by m_quadra on 2023/12/12.
//

import XCTest
import MQKit

@available(iOS 13.0.0, *)
final class TaskWithTimeoutTests: XCTestCase {
    
    func testTimeout() async throws {
        let st = Date()
        let x = try? await withTimeout(1_000) {
            print("task st", Date())
            try? await Task.sleep(nanoseconds: UInt64(3)*NSEC_PER_SEC)
            print("task ed", Date())
            return 1
        }
        
        XCTAssertNil(x)
        let duration = Date().timeIntervalSince(st)
        XCTAssertLessThanOrEqual(duration, 1.1)
    }
    
    func testLoop() async throws {
        let st = Date()
        let x = try? await withTimeout(1_000) {
            print("task st", Date())
            for _ in 0..<1000_0000 {}
            print("task ed", Date())
            return 1
        }
        
        XCTAssertNil(x)
        let duration = Date().timeIntervalSince(st)
        XCTAssertLessThanOrEqual(duration, 1.1)
    }
}
