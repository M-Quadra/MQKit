//
//  Bundle+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/9/2.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var displayName: String? {
        return self.infoDictionary?["CFBundleDisplayName"] as? String
    }
    
    var version: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var bluidVersion: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
}
