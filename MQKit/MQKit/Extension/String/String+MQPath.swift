//
//  String+MQPath.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/27.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String {
    
    /// Documents path
    public static let mq_documents = URL.mq_documents.path
    
    /// Library/Caches path
    public static let mq_caches    = URL.mq_caches.path
    
    /// Library path
    public static let mq_library   = URL.mq_library.path
    
    /// tmp path
    public static let mq_tmp: String = {
        let path = NSTemporaryDirectory()
        guard path.last == "/" else {
            return path
        }
        return String(path.prefix(path.count - 1))
    }()
}
