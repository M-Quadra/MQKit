//
//  UIFont+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/4.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension UIFont {
    
    /// get all fontName in system
    static var allFontNames: [String] {
        var fontNameAry = [String]()
        for familyName in UIFont.familyNames {
#if DEBUG
            print("familyName: ", familyName)
#endif
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
#if DEBUG
                print("    fontName: ", fontName)
#endif
                fontNameAry.append(fontName)
            }
        }
#if DEBUG
        puts("")
#endif
        return fontNameAry
    }
    
    /// get local fontName
    static func localFontName(forPath: String) -> String {
        let fileURL = URL(fileURLWithPath: forPath)
        return UIFont.localFontName(forPath: fileURL)
    }
    static func localFontName(forPath: URL) -> String {
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
    
    static func inPath(_ path: URL, size: CGFloat) -> UIFont? {
        guard let provider = CGDataProvider(url: path as CFURL) else { return nil }
        guard let cgFont = CGFont(provider) else { return nil }
        guard let name = cgFont.postScriptName as? String else { return nil }
        
        if let font = UIFont(name: name, size: size) {
            return font
        }
        
        CTFontManagerRegisterGraphicsFont(cgFont, nil)
        return UIFont(name: name, size: size)
    }
    static func inPath(_ path: String, size: CGFloat) -> UIFont? {
        let url = URL(fileURLWithPath: path)
        return UIFont.inPath(url, size: size)
    }
    
    consuming func height(for str: consuming String, width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        let rect = str.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: self], context: nil)
        return rect.height
    }
}
