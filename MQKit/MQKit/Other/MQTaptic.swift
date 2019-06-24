//
//  MQTaptic.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/21.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

struct MQTaptic {
    enum type {
        case micro
        case light
        case medium
        case heavy
    }
    
    private static var lastTapTime = Date().timeIntervalSince1970 - 5
    
    static func tap(type:type) {
        guard #available(iOS 10.0, *) else {
            return;
        }
        
        let nowTapTime = Date().timeIntervalSince1970
        if nowTapTime > lastTapTime + 0.5 {
            let generator = UIFeedbackGenerator()
            generator.prepare()
        }
        lastTapTime = nowTapTime
        
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
