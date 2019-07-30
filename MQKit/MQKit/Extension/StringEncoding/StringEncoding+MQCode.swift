//
//  StringEncoding+MQCode.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String.Encoding {
    
    init(_ mq_cfStringEncoding: CFStringEncodings) {
        let rawValue = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(mq_cfStringEncoding.rawValue))
        self.init(rawValue: rawValue)
    }
}
