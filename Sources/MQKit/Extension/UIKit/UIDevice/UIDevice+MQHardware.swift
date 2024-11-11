//
//  UIDevice+MQHardware.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/19.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import CoreTelephony

public extension UIDevice {
        
    /// eg. "iPhone11,8"
    var identifier: String {
#if targetEnvironment(simulator)
        if let cStr = getenv("SIMULATOR_MODEL_IDENTIFIER") {
            return String(cString: cStr)
        }
#endif
        
        var sysInfo = utsname()
        uname(&sysInfo)
        
        let machine = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(_SYS_NAMELEN))
        memcpy(machine, &sysInfo.machine, MemoryLayout.size(ofValue: sysInfo.machine))
        let identifierStr = String(cString: machine)
        free(machine)
        
        return identifierStr
    }
    
    /// eg. "iPhone 4s"
    var generation: String {
        // https://www.theiphonewiki.com/wiki/Models
        // https://gist.github.com/adamawolf/3048717
        let identifier = self.identifier
        switch identifier {
        // MARK: - Apple Watch
        case "Watch2,6": return "Apple Watch Series 1" // iOS 13.x
        case "Watch2,7": return "Apple Watch Series 1" // iOS 13.x
        case "Watch2,3": return "Apple Watch Series 2" // iOS 13.x
        case "Watch2,4": return "Apple Watch Series 2" // iOS 13.x
            
        case "Watch3,1": return "Apple Watch Series 3" // iOS 15.x
        case "Watch3,2": return "Apple Watch Series 3" // iOS 15.x
        case "Watch3,3": return "Apple Watch Series 3" // iOS 15.x
        case "Watch3,4": return "Apple Watch Series 3" // iOS 15.x
            
        case "Watch4,1": return "Apple Watch Series 4" // iOS 17.x
        case "Watch4,2": return "Apple Watch Series 4" // iOS 17.x
        case "Watch4,3": return "Apple Watch Series 4" // iOS 17.x
        case "Watch4,4": return "Apple Watch Series 4" // iOS 17.x
            
        case "Watch5,1": return "Apple Watch Series 5" // iOS 17.x
        case "Watch5,2": return "Apple Watch Series 5" // iOS 17.x
        case "Watch5,3": return "Apple Watch Series 5" // iOS 17.x
        case "Watch5,4": return "Apple Watch Series 5" // iOS 17.x
        case "Watch5,9":  return "Apple Watch SE" // iOS 17.x
        case "Watch5,10": return "Apple Watch SE" // iOS 17.x
        case "Watch5,11": return "Apple Watch SE" // iOS 17.x
        case "Watch5,12": return "Apple Watch SE" // iOS 17.x
            
        case "Watch6,1": return "Apple Watch Series 6"
        case "Watch6,2": return "Apple Watch Series 6"
        case "Watch6,3": return "Apple Watch Series 6"
        case "Watch6,4": return "Apple Watch Series 6"
        case "Watch6,6": return "Apple Watch Series 7"
        case "Watch6,7": return "Apple Watch Series 7"
        case "Watch6,8": return "Apple Watch Series 7"
        case "Watch6,9": return "Apple Watch Series 7"
        case "Watch6,10": return "Apple Watch SE (2nd generation)"
        case "Watch6,11": return "Apple Watch SE (2nd generation)"
        case "Watch6,12": return "Apple Watch SE (2nd generation)"
        case "Watch6,13": return "Apple Watch SE (2nd generation)"
        case "Watch6,14": return "Apple Watch Series 8"
        case "Watch6,15": return "Apple Watch Series 8"
        case "Watch6,16": return "Apple Watch Series 8"
        case "Watch6,17": return "Apple Watch Series 8"
        case "Watch6,18": return "Apple Watch Ultra"
        
        case "Watch7,1": return "Apple Watch Series 9"
        case "Watch7,2": return "Apple Watch Series 9"
        case "Watch7,3": return "Apple Watch Series 9"
        case "Watch7,4": return "Apple Watch Series 9"
        case "Watch7,5": return "Apple Watch Ultra 2"
            
        // MARK: - iPad
        case "iPad5,1": return "iPad mini 4" // iPadOS 15.x
        case "iPad5,2": return "iPad mini 4" // iPadOS 15.x
        case "iPad5,3": return "iPad Air 2" // iPadOS 15.x
        case "iPad5,4": return "iPad Air 2" // iPadOS 15.x
        
        case "iPad6,3": return "iPad Pro (9.7-inch)" // iPadOS 16.x
        case "iPad6,4": return "iPad Pro (9.7-inch)" // iPadOS 16.x
        case "iPad6,7": return "iPad Pro (12.9-inch)" // iPadOS 16.x
        case "iPad6,8": return "iPad Pro (12.9-inch)" // iPadOS 16.x
        case "iPad6,11": return "iPad (5th generation)" // iPadOS 16.x
        case "iPad6,12": return "iPad (5th generation)" // iPadOS 16.x
            
        case "iPad7,1": return "iPad Pro (12.9-inch) (2nd generation)" // iPadOS 17.x
        case "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)" // iPadOS 17.x
        case "iPad7,3": return "iPad Pro (10.5-inch)" // iPadOS 17.x
        case "iPad7,4": return "iPad Pro (10.5-inch)" // iPadOS 17.x
        case "iPad7,5": return "iPad (6th generation)" // iPadOS 17.x
        case "iPad7,6": return "iPad (6th generation)" // iPadOS 17.x
        case "iPad7,11": return "iPad (7th generation)"
        case "iPad7,12": return "iPad (7th generation)"
            
        case "iPad8,1": return "iPad Pro (11-inch)"
        case "iPad8,2": return "iPad Pro (11-inch)"
        case "iPad8,3": return "iPad Pro (11-inch)"
        case "iPad8,4": return "iPad Pro (11-inch)"
        case "iPad8,5": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,6": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,7": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,9":  return "iPad Pro (11-inch) (2nd generation)"
        case "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
        case "iPad8,11": return "iPad Pro (12.9-inch) (4th generation)"
        case "iPad8,12": return "iPad Pro (12.9-inch) (4th generation)"
            
        case "iPad11,1": return "iPad mini (5th generation)"
        case "iPad11,2": return "iPad mini (5th generation)"
        case "iPad11,3": return "iPad Air (3rd generation)"
        case "iPad11,4": return "iPad Air (3rd generation)"
        case "iPad11,6": return "iPad (8th generation)"
        case "iPad11,7": return "iPad (8th generation)"
            
        case "iPad12,1": return "iPad (9th generation)"
        case "iPad12,2": return "iPad (9th generation)"
        
        case "iPad13,1": return "iPad Air (4th generation)"
        case "iPad13,2": return "iPad Air (4th generation)"
        case "iPad13,4": return "iPad Pro (11-inch) (3rd generation)"
        case "iPad13,5": return "iPad Pro (11-inch) (3rd generation)"
        case "iPad13,6": return "iPad Pro (11-inch) (3rd generation)"
        case "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
        case "iPad13,8":  return "iPad Pro (12.9-inch) (5th generation)"
        case "iPad13,9":  return "iPad Pro (12.9-inch) (5th generation)"
        case "iPad13,10": return "iPad Pro (12.9-inch) (5th generation)"
        case "iPad13,11": return "iPad Pro (12.9-inch) (5th generation)"
        case "iPad13,16": return "iPad Air (5th generation)"
        case "iPad13,17": return "iPad Air (5th generation)"
        case "iPad13,18": return "iPad (10th generation)"
        case "iPad13,19": return "iPad (10th generation)"
            
        case "iPad14,1": return "iPad mini (6th generation)"
        case "iPad14,2": return "iPad mini (6th generation)"
        case "iPad14,3": return "iPad Pro (11-inch) (4th generation)"
        case "iPad14,4": return "iPad Pro (11-inch) (4th generation)"
        case "iPad14,5": return "iPad Pro (12.9-inch) (6th generation)"
        case "iPad14,6": return "iPad Pro (12.9-inch) (6th generation)"
        case "iPad14,8": return "iPad Air (6th generation)"
        case "iPad14,9": return "iPad Air (6th generation)"
        case "iPad14,10": return "iPad Air (7th generation)"
        case "iPad14,11": return "iPad Air (7th generation)"
            
        case "iPad16,3": return "iPad Pro (11-inch) (5th generation)"
        case "iPad16,4": return "iPad Pro (11-inch) (5th generation)"
        case "iPad16,5": return "iPad Pro (12.9-inch) (7th generation)"
        case "iPad16,6": return "iPad Pro (12.9-inch) (7th generation)"
            
        // MARK: - iPhone
        // https://endoflife.date/iphone
        case "iPhone8,1": return "iPhone 6s" // iOS 15.x
        case "iPhone8,2": return "iPhone 6s Plus" // iOS 15.x
        case "iPhone8,4": return "iPhone SE (1st generation)" // iOS 15.x
            
        case "iPhone9,1": return "iPhone 7" // iOS 15.x
        case "iPhone9,3": return "iPhone 7" // iOS 15.x
        case "iPhone9,2": return "iPhone 7 Plus" // iOS 15.x
        case "iPhone9,4": return "iPhone 7 Plus" // iOS 15.x
            
        case "iPhone10,1": return "iPhone 8" // iOS 16.x
        case "iPhone10,4": return "iPhone 8" // iOS 16.x
        case "iPhone10,2": return "iPhone 8 Plus" // iOS 16.x
        case "iPhone10,5": return "iPhone 8 Plus" // iOS 16.x
        case "iPhone10,3": return "iPhone X" // iOS 16.x
        case "iPhone10,6": return "iPhone X" // iOS 16.x
            
        case "iPhone11,8": return "iPhone XR"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4": return "iPhone XS Max"
        case "iPhone11,6": return "iPhone XS Max"
            
        case "iPhone12,1": return "iPhone 11"
        case "iPhone12,3": return "iPhone 11 Pro"
        case "iPhone12,5": return "iPhone 11 Pro Max"
        case "iPhone12,8": return "iPhone SE (2nd generation)"
            
        case "iPhone13,1": return "iPhone 12 mini"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,4": return "iPhone 12 Pro Max"
        
        case "iPhone14,2": return "iPhone 13 Pro"
        case "iPhone14,3": return "iPhone 13 Pro Max"
        case "iPhone14,4": return "iPhone 13 mini"
        case "iPhone14,5": return "iPhone 13"
        case "iPhone14,6": return "iPhone SE (3rd generation)"
        case "iPhone14,7": return "iPhone 14"
        case "iPhone14,8": return "iPhone 14 Plus"
            
        case "iPhone15,2": return "iPhone 14 Pro"
        case "iPhone15,3": return "iPhone 14 Pro Max"
        case "iPhone15,4": return "iPhone 15"
        case "iPhone15,5": return "iPhone 15 Plus"
            
        case "iPhone16,1": return "iPhone 15 Pro"
        case "iPhone16,2": return "iPhone 15 Pro Max"
            
        case "iPhone17,1": return "iPhone 16 Pro"
        case "iPhone17,2": return "iPhone 16 Pro Max"
        case "iPhone17,3": return "iPhone 16"
        case "iPhone17,4": return "iPhone 16 Plus"
            
        // MARK: - iPod touch
        case "iPod9,1": return "iPod touch (7th generation)" // iOS 15.x
            
        default: break
        }
        
        return identifier.isEmpty ? "Unknown" : identifier
    }
    
    private static var mq_privateTotalCapacity: UInt64 = 0
    var mq_totalCapacity: UInt64 {
        if UIDevice.mq_privateTotalCapacity > 0 {
            return UIDevice.mq_privateTotalCapacity
        }
        
        var info = statfs()
        guard statfs("/var", &info) == 0 else {
            return 0
        }
        
        UIDevice.mq_privateTotalCapacity = info.f_blocks * UInt64(info.f_bsize)
        return UIDevice.mq_privateTotalCapacity
    }
    
    var mq_availableCapacity: UInt64 {
        var info = statfs()
        guard statfs("/var", &info) == 0 else {
            return 0
        }
        
        return info.f_bavail * UInt64(info.f_bsize)
    }
    
    var mq_totalMemory: UInt64 {
        return ProcessInfo.processInfo.physicalMemory
    }
    
    /// less than actual value
    var mq_availableMemory: UInt64 {
        // https://stackoverflow.com/a/47354072
        var pagesize: vm_size_t = 0
        
        let host_port: mach_port_t = mach_host_self()
        var host_size: mach_msg_type_number_t = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.stride / MemoryLayout<integer_t>.stride)
        host_page_size(host_port, &pagesize)
        
        var vm_stat: vm_statistics = vm_statistics_data_t()
        withUnsafeMutablePointer(to: &vm_stat) { (vmStatPointer) -> Void in
            vmStatPointer.withMemoryRebound(to: integer_t.self, capacity: Int(host_size)) {
                if (host_statistics(host_port, HOST_VM_INFO, $0, &host_size) != KERN_SUCCESS) {
                    #if DEBUG
                    print("Error: Failed to fetch vm statistics")
                    #endif
                }
            }
        }
        
        /* Stats in bytes */
        let mem_free: UInt64 = UInt64(vm_stat.free_count) * UInt64(pagesize)
        return mem_free;
    }
    
    var mq_cpuThreads: Int {
        // 6c12t will return 12
        return ProcessInfo.processInfo.processorCount
    }
    
    #if canImport(CTCarrier)
    public var mq_simInfo: [CTCarrier] {
        let info = CTTelephonyNetworkInfo()
        if #available(iOS 12.0, *) {
            guard let providers = info.serviceSubscriberCellularProviders else {
                return []
            }
            
            let carrierAry = providers.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
            return carrierAry.map { $1 }
        }
        
        guard let carrier = info.subscriberCellularProvider else {
            return []
        }
        return [carrier]
    }
    #endif
    
    /// is iPad
    var mq_isPad: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
}
