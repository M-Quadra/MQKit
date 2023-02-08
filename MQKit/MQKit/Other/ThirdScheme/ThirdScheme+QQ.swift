//
//  ThirdScheme+QQ.swift
//  MQKit
//
//  Created by m_quadra on 2023/2/8.
//  Copyright © 2023 M_noAria. All rights reserved.
//

import UIKit

public extension ThirdScheme {
    
    struct QQ {
        private init() {}
    }
}

fileprivate extension URL {
    
    static func toGroup(_ group: String) -> URL? {
        return URL(string: "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=\(group)&card_type=group&source=qrcode")
    }
    
    static var toQRCode: URL? {
        return URL(string: "mqqapi://qrcode/scan_qrcode?version=1&src_type=app")
    }
}

public extension ThirdScheme.QQ {
    
    /// QQ group card
    static func canOpenQQGroup(_ group: String) -> Bool {
        guard let url = URL.toGroup(group) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    /// QQ group card
    @available(iOS 13.0.0, *)
    @MainActor
    static func byOpenQQGroup(
        _ group: String,
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
    ) async -> Bool {
        guard let url = URL.toGroup(group) else { return false }
        return await UIApplication.shared.open(url, options: options)
    }

    /// QQ group card
    static func openQQGroup(
        _ group: String,
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
        completionHandler handler: ((Bool) -> Void)? = nil
    ) {
        guard let url = URL.toGroup(group) else {
            handler?(false)
            return
        }
        UIApplication.shared.open(
            url,
            options: options,
            completionHandler: handler
        )
    }
    
    /// qr-code scan
    static func canOpenScan() -> Bool {
        guard let url = URL.toQRCode else { return false }
        return UIApplication.shared.canOpenURL(url)
    }

    /// qr-code scan
    @available(iOS 13.0.0, *)
    @MainActor
    static func byOpenScan(
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]
    ) async -> Bool {
        guard let url = URL.toQRCode else { return false }
        return await UIApplication.shared.open(url, options: options)
    }

    /// qr-code scan
    static func openScan(
        options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
        completionHandler handler: ((Bool) -> Void)? = nil
    ) {
        guard let url = URL.toQRCode else {
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
