//
//  UIImage+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/18.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIImage {
    
    public var mq_averageColor: UIColor {
        guard let cgImg = self.cgImage else {
            return .clear;
        }

        let width = 1
        let height = 1
        let dataSize = width * height * 4
        let data = UnsafeMutablePointer<UInt8>.allocate(capacity: dataSize)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext.init(data: data,
                                           width: width,
                                           height: height,
                                           bitsPerComponent: 8,
                                           bytesPerRow: width * 4, space: colorSpace,
                                           bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
            else {
                return .clear;
        }
        context.draw(cgImg, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        let rgba = [CGFloat(data[0]),
                    CGFloat(data[1]),
                    CGFloat(data[2]),
                    CGFloat(data[3] == 0 ? 255 : data[3])]
        free(data)
        return UIColor(red:   rgba[0] / rgba[3],
                       green: rgba[1] / rgba[3],
                       blue:  rgba[2] / rgba[3],
                       alpha: rgba[3] / 255)
    }
    
    public convenience init(mq_layer layer: CALayer, alpha: Bool) {
        var optImg: UIImage?
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, !alpha, 0)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            optImg = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        if let cgImg = optImg?.cgImage {
            self.init(cgImage: cgImg, scale: UIScreen.main.scale, orientation: .up)
        } else {
            self.init()
        }
    }
    
    /// size = CGSize(1, 1)
    public convenience init(mq_color color: UIColor, size: CGSize = CGSize(mq_edge: 1)) {
        guard size.mq_isValidated() else {
            self.init()
            return
        }
        
        var optImg: UIImage?
        let opaque = color.mq_alpha == 1.0
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: size))
            optImg = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        if let cgImg = optImg?.cgImage {
            self.init(cgImage: cgImg, scale: UIScreen.main.scale, orientation: .up)
        } else {
            self.init()
        }
    }
}
