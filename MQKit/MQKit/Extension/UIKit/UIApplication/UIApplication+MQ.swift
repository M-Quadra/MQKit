//
//  UIApplication+MQ.swift
//  MQKit
//
//  Created by m_quadra on 2022/10/11.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    func openSettings(
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
        completionHandler completion: ((Bool) -> Void)? = nil
    ) {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            completion?(false)
            return
        }
        
        self.open(url, options: options, completionHandler: completion)
    }
}
