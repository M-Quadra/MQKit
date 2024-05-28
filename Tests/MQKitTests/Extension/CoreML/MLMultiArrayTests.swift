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
        let ts: MLMultiArray = try .randn(shape: [10, 20, 30, 40], dataType: .float16)
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
    @available(iOS 16.0, *)
    func testRandnFP16Benchmark0() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], dataType: .float16)
    }}
    @available(iOS 16.0, *)
    func testRandnFP16Benchmark1() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], scale: .random(in: 0.5..<2), dataType: .float16)
    }}
    
    func testRandnFP32() throws {
        let ts: MLMultiArray = try .randn(shape: [10, 20, 30, 40], dataType: .float32)
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
    func testRandnFP32Benchmark0() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], dataType: .float32)
    }}
    func testRandnFP32Benchmark1() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], scale: .random(in: 0.5..<2), dataType: .float32)
    }}
    
    @available(iOS 14.0, *)
    func testRandnFP64() throws {
        let ts: MLMultiArray = try .randn(shape: [10, 20, 30, 40], dataType: .float64)
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
    @available(iOS 14.0, *)
    func testRandnFP64Benchmark0() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], dataType: .float64)
    }}
    @available(iOS 14.0, *)
    func testRandnFP64Benchmark1() { measure {
        _ = try! MLMultiArray.randn(shape: [10, 20, 30, 40], scale: .random(in: 0.5..<2), dataType: .float64)
    }}
}
