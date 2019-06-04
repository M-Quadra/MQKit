//
//  UIFont+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/4.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIFont {
    /// get all fontName in system
    public class var mq_allFontNames: [String] {
        get {
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
    }
}
