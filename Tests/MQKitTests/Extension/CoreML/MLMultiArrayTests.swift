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
    
    func testRandn() throws {
        let ts: MLMultiArray = try .randn(shape: [100, 200, 3])
        XCTAssertLessThanOrEqual(abs(ts.mean - 0), 1e-2)
        XCTAssertLessThanOrEqual(abs(ts.variance - 1), 1e-2)
    }
}
