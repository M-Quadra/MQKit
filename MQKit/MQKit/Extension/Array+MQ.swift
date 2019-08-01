//
//  Array+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/1.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension Array {
    
    public func mq_jsonString(encoding: String.Encoding = .utf8) -> String {
        guard JSONSerialization.isValidJSONObject(self) else {
            return ""
        }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .init(rawValue: 0)) else {
            return ""
        }
        return String(data: jsonData, encoding: encoding) ?? ""
    }
}
