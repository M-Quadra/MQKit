//
//  MLMultiArrayTests.swift
//
//
//  Created by m_quadra on 2024/4/17.
//

import XCTest
@testable import MQKit
import CoreML

final class MLMultiArrayTests: XCTestCase {
    
    @available(iOS 16.0, *)
    func testRandnFP16() throws {
        let ts: MLMultiArray = try .randnFP16(shape: [10, 20, 30, 40])
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
    @available(iOS 16.0, *)
    func testRandnFP16Benchmark0() { measure {
        _ = try! MLMultiArray.randnFP16(shape: [10, 20, 30, 40])
    }}
    
    func testRandnFP32() throws {
        let ts: MLMultiArray = try .randnFP32(shape: [10, 20, 30, 40])
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
    func testRandnFP32Benchmark0() { measure {
        _ = try! MLMultiArray.randnFP32(shape: [10, 20, 30, 40])
    }}
}
