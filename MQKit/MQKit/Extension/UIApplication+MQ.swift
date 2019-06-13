//
//  UIApplication+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/12.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public class var mq_appDisplayName: String {
        get {
            let infoDic = Bundle.main.infoDictionary ?? [:]
            let displayName = infoDic["CFBundleDisplayName"] as? String ?? ""
            return displayName
        }
    }
    
    public class var mq_appBundleIdentifier: String {
        get {
            let infoDic = Bundle.main.infoDictionary ?? [:]
            let bundleID = infoDic["CFBundleIdentifier"] as? String ?? ""
            return bundleID
        }
    }
    
    public class var mq_appVersion: String {
        get {
            let infoDic = Bundle.main.infoDictionary ?? [:]
            let version = infoDic["CFBundleShortVersionString"] as? String ?? ""
            return version
        }
    }
    
    public class var mq_appBluidVersion: String {
        get {
            let infoDic = Bundle.main.infoDictionary ?? [:]
            let bluidVersion = infoDic["CFBundleVersion"] as? String ?? ""
            return bluidVersion
        }
    }
    
    /// open QQ group card
    public func mq_openQQGroup(qqGroup: String) -> Bool {
        let urlStr = String(format: "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&card_type=group", qqGroup)
        let qqGroupUrl = URL(string: urlStr) ?? URL(fileURLWithPath: "")
        return self.openURL(qqGroupUrl)
    }
}
