//
//  UIApplication+MQThird.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/16.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public struct MQThird {
        
        /// open QQ group card
        static public func openQQGroup(qqGroup: String) -> Bool {
            let urlStr = String(format: "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&card_type=group", qqGroup)
            let qqGroupUrl = URL(string: urlStr) ?? URL(fileURLWithPath: "")
            return UIApplication.shared.openURL(qqGroupUrl)
        }
        
        /// open QQ qr-code scan
        static public func openQQScan() -> Bool {
            guard let scanurl = URL(string: "mqqapi://qrcode/scan_qrcode?version=1&src_type=app") else {
                return false
            }
            return UIApplication.shared.openURL(scanurl)
        }
        
        /// open QQ microapp
        static public func openQQMicroapp(_ urlStr: String) -> Bool {
            guard let sufUrlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                return false
            }
            guard let url = URL(string: "mqqapi://microapp/open?url=" + sufUrlStr) else {
                return false
            }
            return UIApplication.shared.openURL(url)
        }
        
        /// open WeChet qr-code scan
        static public func openWeChetScan() -> Bool {
            guard let scanurl = URL(string: "weixin://scanqrcode") else {
                return false
            }
            return UIApplication.shared.openURL(scanurl)
        }
    }
    
}
