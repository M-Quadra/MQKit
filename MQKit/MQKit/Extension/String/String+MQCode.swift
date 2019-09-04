//
//  String+MQCode.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/27.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    /// 32hex lowercased MD5
    var mq_md5: String {
        return MQCrypt.MD5.encrypt(str: self)
    }
    
    public func mq_base64Encode(using: String.Encoding = .utf8) -> String {
        guard let data = self.data(using: using) else {
            return ""
        }
        return data.base64EncodedString()
    }
    
    public func mq_base64Decode(using: String.Encoding = .utf8) -> String {
        guard let data = Data(base64Encoded: self) else {
            return ""
        }
        return String(data: data, encoding: using) ?? ""
    }
    
    public func mq_jsonToDictionary(using: String.Encoding = .utf8) -> [String: Any] {
        guard let data = self.data(using: using) else {
            return [:]
        }
        
        let dic = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        let optDic = dic as? [String: Any] ?? [:]
        return optDic
    }
}
