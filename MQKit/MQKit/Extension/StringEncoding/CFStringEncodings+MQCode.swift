//
//  CFStringEncodings+MQCode.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/29.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension CFStringEncodings {
    
    var mq_StringEncoding: String.Encoding {
        return String.Encoding(self)
    }
}
