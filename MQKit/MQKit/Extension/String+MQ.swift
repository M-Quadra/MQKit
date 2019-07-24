//
//  String+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/6.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation
import AdSupport
import CommonCrypto
import UIKit

extension String {
    public static let mq_documents = URL.mq_documents.path
    public static let mq_caches    = URL.mq_caches.path
    public static let mq_library   = URL.mq_library.path
    public static let mq_tmp       = NSTemporaryDirectory()
    
    public static let mq_IDFA = ASIdentifierManager.shared().advertisingIdentifier.uuidString
    public static let mq_IDFV = UIDevice.current.identifierForVendor?.uuidString ?? ""
    public static var mq_UUID: String {
        return NSUUID().uuidString
    }
    
    var mq_md5: String {
        if self.count <= 0 {
            return ""
        }
        let data = self.cString(using: .utf8)
        let len = strlen(data!)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        CC_MD5(data, CC_LONG(len), buffer)
        free(buffer)
        
        return String(format: "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                      buffer[0],  buffer[1],  buffer[2],  buffer[3],
                      buffer[4],  buffer[5],  buffer[6],  buffer[7],
                      buffer[8],  buffer[9],  buffer[10], buffer[11],
                      buffer[12], buffer[13], buffer[14], buffer[15]
        )
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
    
    public struct MQStringFilter {
        let set: CharacterSet
        let closure: (Character) -> Bool
        
        /// [0-9]
        public static var naturalNumber: MQStringFilter {
            return MQStringFilter(set: .decimalDigits) { $0.isNumber }
        }
    }
    
    public func mq_substring(with filter: MQStringFilter) -> String {
        let iptStr = self.filter(filter.closure)
        let originSet = CharacterSet(charactersIn: iptStr)
        
        let filterSet = originSet.subtracting(filter.set)
        let optStr = iptStr.components(separatedBy: filterSet).joined(separator: "")
        return optStr
    }
}
