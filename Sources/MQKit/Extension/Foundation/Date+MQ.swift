//
//  Date+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/14.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public extension Date {
    
    init?(_ str: consuming String, formatter: consuming String, timeZone: consuming TimeZone = TimeZone.current) {
        let fmt = DateFormatter()
        fmt.dateFormat = formatter
        fmt.timeZone = timeZone
        guard let ts = (consume fmt).date(from: str)?.timeIntervalSince1970 else { return nil }
        
        self.init(timeIntervalSince1970: consume ts)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    /// [1, 12]
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    /// [1, 31]
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    /// /h
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    /// /min
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    /// /s
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    consuming func stringValue(formatter: consuming String, timeZone: consuming TimeZone = TimeZone.current) -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = formatter
        fmt.timeZone = timeZone
        return (consume fmt).string(from: self)
    }
}
