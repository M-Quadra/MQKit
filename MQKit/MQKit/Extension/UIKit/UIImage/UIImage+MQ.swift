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
            return .clear
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
                return .clear
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
    
    public func mq_corner(radius: CGFloat, corners: UIRectCorner = .allCorners) -> UIImage {
        if radius <= 0 {
            return self
        }
        
        var pathAry:[UIBezierPath] = []
        let rect = CGRect(origin: .zero, size: size)
        
        if corners.isEmpty || corners.rawValue == 0xF || corners == .allCorners {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: 0))
            pathAry = [path]
        } else {
            if corners.contains(.topLeft) {
                pathAry.append(UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomLeft, cornerRadii: CGSize(width: radius, height: 0)))
            }
            if corners.contains(.topRight) {
                pathAry.append(UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomRight, cornerRadii: CGSize(width: radius, height: 0)))
            }
            if corners.contains(.bottomLeft) {
                pathAry.append(UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: radius, height: 0)))
            }
            if corners.contains(.bottomRight) {
                pathAry.append(UIBezierPath(roundedRect: rect, byRoundingCorners: .topRight, cornerRadii: CGSize(width: radius, height: 0)))
            }
        }
        
        var optImg: UIImage?
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        if let context = UIGraphicsGetCurrentContext(), let cgImg = cgImage {
            context.scaleBy(x: 1, y: -1)
            context.translateBy(x: 0, y: -rect.height)
            
            for path in pathAry {
                path.addClip()
            }
            
            context.draw(cgImg, in: rect)
            optImg = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        guard let img = optImg else {
            return self
        }
        return img
    }
    
    /// [y][x][RR, GG, BB, AA]
    public func mq_pixelRGBA() -> [[[UInt8]]]? {
        guard let cgImg = self.cgImage else {
            return nil
        }
        
        let pixWidth = cgImg.width
        let pixHeight = cgImg.height
        let bytesPerRow = pixWidth * pixHeight * 4
        if pixWidth*pixHeight <= 0 {
            return nil
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext.init(data: nil,
                                           width: pixWidth,
                                           height: pixHeight,
                                           bitsPerComponent: 8,
                                           bytesPerRow: pixWidth * 4,
                                           space: colorSpace,
                                           bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue) else {
            return nil
        }
        
        context.draw(cgImg, in: CGRect(x: 0, y: 0, width: pixWidth, height: pixHeight))
        guard let imgData = context.data else {
            return nil
        }

        let imgDataUint8 = imgData.bindMemory(to: UInt8.self, capacity: bytesPerRow)
        
        var pixAry = Array(repeating: Array(repeating: Array(repeating: UInt8(0), count: 4), count: pixWidth), count: pixHeight)
        for y in 0..<pixHeight {
            let iy = y * pixWidth*4
            for x in 0..<pixWidth {
                let ix = x * 4
                for i in 0..<4 {
                    let idx = iy + ix + i
                    pixAry[y][x][i] = imgDataUint8[idx]
                }
            }
        }
        
        return pixAry
    }
    
    /// !alpha
    public var mq_opaque: Bool {
        guard let cgImg = self.cgImage else {
            return false
        }
        
        return cgImg.alphaInfo == .noneSkipLast
            || cgImg.alphaInfo == .noneSkipFirst
            || cgImg.alphaInfo == .none
    }
    
    public func mq_image(orientation: Orientation) -> UIImage? {
        if orientation == .up {
            return self
        }
        
        var contextSiz = self.size
        if orientation == .left || orientation == .right {
            contextSiz = CGSize(width: contextSiz.height, height: contextSiz.width)
        }
        
        var optImg: UIImage? = self
        
        UIGraphicsBeginImageContextWithOptions(contextSiz, self.mq_opaque, self.scale)
        if let contextRef = UIGraphicsGetCurrentContext() {
            switch orientation {
            case .up: break
            case .down:
                contextRef.translateBy(x: contextSiz.width, y: contextSiz.height);
                contextRef.rotate(by: .mq_radian(angle: 180))
            case .left:
                contextRef.translateBy(x: 0, y: contextSiz.height)
                contextRef.rotate(by: .mq_radian(angle: -90))
            case .right:
                contextRef.translateBy(x: contextSiz.width, y: 0)
                contextRef.rotate(by: .mq_radian(angle: 90))
            case .upMirrored: fallthrough
            case .downMirrored:
                contextRef.translateBy(x: 0, y: contextSiz.height)
                contextRef.scaleBy(x: 1, y: -1)
            case .leftMirrored: fallthrough
            case .rightMirrored:
                contextRef.translateBy(x: contextSiz.width, y: 0)
                contextRef.scaleBy(x: -1, y: 1)
            default: break
            }
            
            self.draw(in: CGRect(mq_size: self.size))
            optImg = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        return optImg
    }
}
