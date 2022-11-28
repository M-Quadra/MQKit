//
//  Task+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/29.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

@available(iOS 13.0, *)
public extension Task where Success == Never, Failure == Never {
    
    static func sleep(millisecond duration: UInt64) async throws {
        try await Task.sleep(nanoseconds: duration * 1_000_000)
    }
}
