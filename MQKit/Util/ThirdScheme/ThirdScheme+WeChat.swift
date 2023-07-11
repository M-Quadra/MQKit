//
//  ThirdScheme+WeChat.swift
//  MQKit
//
//  Created by m_quadra on 2023/2/8.
//  Copyright © 2023 M_noAria. All rights reserved.
//

import UIKit

public extension ThirdScheme {
    
    struct WeChat {
        private init() {}
    }
}

fileprivate extension URL {
    
    static var toScan: URL? {
        return URL(string: "weixin://scanqrcode")
    }
}

public extension ThirdScheme.WeChat {
    
    /// WeChet qr-code scan
    static func canOpenScan() -> Bool {
        guard let url = URL.toScan else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    /// WeChet qr-code scan
    @available(iOS 13.0.0, *)
    @MainActor
    static func byOpenScan(
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
    ) async -> Bool {
        guard let url = URL.toScan else { return false }
        return await UIApplication.shared.open(url, options: options)
    }
    
    /// WeChet qr-code scan
    static func openScan(
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
        completionHandler handler: ((Bool) -> Void)? = nil
    ) {
        guard let url = URL.toScan else {
            handler?(false)
            return
        }
        UIApplication.shared.open(
            url,
            options: options,
            completionHandler: handler
        )
    }
}
