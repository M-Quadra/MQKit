//
//  UIFont+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/4.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import CoreText

extension UIFont {
    /// get all fontName in system
    public class var mq_allFontNames: [String] {
        var fontNameAry = [String]()
        for familyName in UIFont.familyNames {
            print("familyName: ", familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("    fontName: ", fontName)
                fontNameAry.append(fontName)
            }
        }
        puts("")
        return fontNameAry
    }
    
    /// get local fontName
    public class func mq_localFontName(forPath: String) -> String {
        let fileURL = URL(fileURLWithPath: forPath)
        return UIFont.mq_localFontName(forPath: fileURL)
    }
    public class func mq_localFontName(forPath: URL) -> String {
        let preProvider = CGDataProvider(url: forPath as CFURL)
        guard let provider = preProvider else {
            return ""
        }
        let preFont = CGFont(provider)
        guard let font = preFont else {
            return ""
        }

        return String(font.postScriptName ?? "")
    }
}
