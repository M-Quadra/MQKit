//
//  URL+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/6.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension URL {
    public static let mq_documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: "")
    public static let mq_caches    = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: "")
    public static let mq_library   = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: "")
    public static let mq_tmp       = URL(fileURLWithPath: .mq_tmp)
    
    public init?(mq_srcURL: String, href: String) {
        if href.hasPrefix("#") {
            return nil
        }
        
        if href.contains("://") {
            self.init(string: href)
            return
        }
        
        if href.hasPrefix("//") {
            let ary = mq_srcURL.components(separatedBy: ":")
            guard let prot = ary.first else {
                return nil
            }
            
            self.init(string: prot + ":" + href)
            return
        }
        
        if href.hasPrefix("/") {
            let ary = mq_srcURL.components(separatedBy: "/")
            if ary.count < 3 {
                return nil
            }
            
            self.init(string: ary[0...2].joined(separator: "/") + href)
            return
        }
        
        if href.contains("?") {
            guard let preURL = mq_srcURL.components(separatedBy: "?").first else {
                return nil
            }
            
            self.init(string: preURL + href)
            return
        }
        
        var ary = mq_srcURL.components(separatedBy: "/")
        if ary.count < 2 {
            return nil
        }
        
        ary[ary.count - 1] = href
        self.init(string: ary.joined(separator: "/"))
    }
}
