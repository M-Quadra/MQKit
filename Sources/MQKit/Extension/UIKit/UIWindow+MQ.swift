//
//  UIWindow+MQ.swift
//
//
//  Created by m_quadra on 2023/11/8.
//

import UIKit

public extension UIWindow {
    
    @MainActor
    static var key: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        }
        
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
