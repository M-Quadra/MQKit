//
//  FileManager+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/5.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension FileManager {
    public static let mq_cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
    public static let mq_cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: "")
}
