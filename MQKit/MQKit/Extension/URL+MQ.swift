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
}
