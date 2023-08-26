//
//  StringEncoding+MQCode.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public extension String.Encoding {
    
    init(_ cfStrEncoding: CFStringEncodings) {
        let rawValue = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(cfStrEncoding.rawValue))
        self.init(rawValue: rawValue)
    }
}
