//
//  Comparable+MQ.swift
//
//
//  Created by m_quadra on 2024/3/12.
//

import Foundation

@inlinable
public func clamp<T : Comparable>(
    low: consuming T,
    value: consuming T,
    high: consuming T
) -> T {
    return min(max(low, value), high)
}
