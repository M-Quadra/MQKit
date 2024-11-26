//
//  Color+Creator.swift
//  MQKit
//
//  Created by m_quadra on 2024/11/26.
//

import SwiftUI

public extension Color {
    
    /// #RRGGBB
    static func hex(_ hex: String, alpha: Double = 1) -> Color {
        guard var num = UInt64(hex.dropFirst(), radix: 16) else {
            assertionFailure("Invalid hex string")
            return .clear
        }
        
        let b = Double(num & 0xFF)/255
        num >>= 8
        let g = Double(num & 0xFF)/255
        num >>= 8
        let r = Double(num & 0xFF)/255
        return Color(red: r, green: g, blue: b, opacity: alpha)
    }
}
