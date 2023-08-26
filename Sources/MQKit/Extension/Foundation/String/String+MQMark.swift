//
//  String+MQMark.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/27.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import AdSupport

extension String {
    
    public static var mq_IDFA: String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    public static let mq_IDFV = UIDevice.current.identifierForVendor?.uuidString ?? ""
    
    public static var mq_UUID: String {
        return NSUUID().uuidString
    }
}
