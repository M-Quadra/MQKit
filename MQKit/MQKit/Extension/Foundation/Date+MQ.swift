//
//  Date+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/14.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension Date {
    
    init(mq_str: String, formatter: String, timeZone: TimeZone = TimeZone.current) {
        let nowFormatter = DateFormatter()
        nowFormatter.dateFormat = formatter
        nowFormatter.timeZone = timeZone
        
        guard let date = nowFormatter.date(from: mq_str) else {
            self.init(timeIntervalSince1970: 0)
            return
        }
        
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    
    public var mq_year:Int {
        return Calendar.current.component(.year, from: self)
    }
    /// [1, 12]
    public var mq_month:Int {
        return Calendar.current.component(.month, from: self)
    }
    /// [1, 31]
    public var mq_day:Int {
        return Calendar.current.component(.day, from: self)
    }
    /// /h
    public var mq_hour:Int {
        return Calendar.current.component(.hour, from: self)
    }
    /// /min
    public var mq_minute:Int {
        return Calendar.current.component(.minute, from: self)
    }
    /// /s
    public var mq_second:Int {
        return Calendar.current.component(.second, from: self)
    }
    
    public func mq_stringValue(formatter: String, timeZone: TimeZone = TimeZone.current) -> String {
        let nowFormatter = DateFormatter()
        nowFormatter.dateFormat = formatter
        nowFormatter.timeZone = timeZone
        return nowFormatter.string(from: self)
    }
}
