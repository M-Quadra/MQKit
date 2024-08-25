//
//  MQTaptic.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/21.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

@MainActor public struct MQTaptic {
    fileprivate init() {}
}

// MARK: - Public
public extension MQTaptic {
    
    enum type {
        case micro
        case light
        case medium
        case heavy
    }
    
    static func tap(type:type) {
        switch type {
        case .micro:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
    }
}
