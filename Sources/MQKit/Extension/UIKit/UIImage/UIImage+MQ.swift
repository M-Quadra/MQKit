//
//  UIImage+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/18.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

public extension UIImage {
    
    var averageColor: UIColor {
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
    
    func corner(radius: CGFloat, corners: UIRectCorner = .allCorners) -> UIImage {
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
    func pixelRGBA() -> [[[UInt8]]]? {
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
    var opaque: Bool {
        guard let cgImg = self.cgImage else {
            return false
        }
        
        return cgImg.alphaInfo == .noneSkipLast
            || cgImg.alphaInfo == .noneSkipFirst
            || cgImg.alphaInfo == .none
    }
    
    func orientation(_ orientation: Orientation) -> UIImage {
        if orientation == .up {
            return self
        }
        
        var ctxSize = self.size
        if orientation == .left || orientation == .right {
            ctxSize = CGSize(width: ctxSize.height, height: ctxSize.width)
        }
        
        return UIImage.render(
            size: ctxSize,
            opaque: self.opaque,
            scale: self.scale
        ) { ctx in
            switch orientation {
            case .up: break
            case .down:
                ctx.translateBy(x: ctxSize.width, y: ctxSize.height);
                ctx.rotate(by: .radian(angle: 180))
            case .left:
                ctx.translateBy(x: 0, y: ctxSize.height)
                ctx.rotate(by: .radian(angle: -90))
            case .right:
                ctx.translateBy(x: ctxSize.width, y: 0)
                ctx.rotate(by: .radian(angle: 90))
            case .upMirrored: fallthrough
            case .downMirrored:
                ctx.translateBy(x: 0, y: ctxSize.height)
                ctx.scaleBy(x: 1, y: -1)
            case .leftMirrored: fallthrough
            case .rightMirrored:
                ctx.translateBy(x: ctxSize.width, y: 0)
                ctx.scaleBy(x: -1, y: 1)
            default: break
            }
            
            self.draw(in: CGRect(self.size))
        }
    }
    
    enum MQResizingMode {
        case scaleToFill
        
        case scaleAspectFit
        
        case scaleAspectFill
        case scaleAspectFillTop
        case scaleAspectFillBottom
        
        func rect(dst: CGSize, src: CGSize) -> CGRect {
            if self == .scaleToFill { return CGRect(dst) }
            
            let wScale = dst.width / src.width
            let hScale = dst.height / src.height
            let scale = (self == .scaleAspectFit ? min : max)(wScale, hScale)
            
            var opt = CGRect(src * scale)
            opt.origin.x = (dst.width-opt.width) / 2
            switch self {
            case .scaleAspectFillTop:
                opt.origin.y = 0
            case .scaleAspectFillBottom:
                opt.origin.y = dst.height - opt.height
            default:
                opt.origin.y = (dst.height-opt.height) / 2
            }
            return opt
        }
    }
    
    func resize(
        to size: CGSize,
        scale: CGFloat? = nil,
        model: UIImage.MQResizingMode = .scaleToFill
    ) -> UIImage {
        let scale = scale ?? self.scale
        let rect = model.rect(dst: size, src: self.size)
        let opaque = (model != .scaleAspectFit || rect.size.equalTo(size)) ? self.opaque : false
        return .render(size: size, opaque: opaque, scale: scale) { ctx in
            self.draw(in: rect)
        }
    }
    
    func tint(color: consuming UIColor) -> UIImage? {
        if #available(iOS 13.0, *) {
            return .render(size: self.size, opaque: self.opaque, scale: self.scale) { ctx in
                self.withTintColor(color).draw(at: .zero)
            }
        }
        
        guard let cgImg = self.cgImage else { return nil }
        return .render(size: self.size, opaque: self.opaque, scale: self.scale) { ctx in
            color.set()
            
            ctx.translateBy(x: 0, y: self.size.height)
            ctx.scaleBy(x: 1.0, y: -1.0)
            ctx.setBlendMode(.normal)
            
            ctx.clip(to: CGRect(origin: .zero, size: self.size), mask: cgImg)
            ctx.fill(CGRect(origin: .zero, size: self.size))
        }
    }
    
    func blend(color: consuming UIColor) -> UIImage? {
        guard let cgImg = self.cgImage,
              let cgImgColored = self.tint(color: color)?.cgImage,
              let filter = CIFilter(name: "CIColorBlendMode", parameters: [
                kCIInputImageKey: CIImage(cgImage: consume cgImgColored),
                kCIInputBackgroundImageKey: CIImage(cgImage: consume cgImg),
              ]),
              let optImg = filter.outputImage,
              let imgRef = CIContext().createCGImage(optImg, from: optImg.extent)
        else { return nil }
        
        return UIImage(cgImage: consume imgRef, scale: self.scale, orientation: self.imageOrientation)
    }
}
