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
        public func openQQGroup(qqGroup: String) -> Bool {
            let urlStr = String(format: "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&card_type=group", qqGroup)
            let qqGroupUrl = URL(string: urlStr) ?? URL(fileURLWithPath: "")
            return UIApplication.shared.openURL(qqGroupUrl)
        }
        
        /// open QQ qr-code scan
        public func openQQScan() -> Bool {
            guard let scanurl = URL(string: "mqqopensdkapi://bizAgent/qm/qr?url=wtf") else {
                return false
            }
            return UIApplication.shared.openURL(scanurl)
        }
        
        /// open WeChet qr-code scan
        public func openWeChetScan() -> Bool {
            guard let scanurl = URL(string: "weixin://scanqrcode") else {
                return false
            }
            return UIApplication.shared.openURL(scanurl)
        }
    }
    
    public static let mq_third = MQThird()    
}
