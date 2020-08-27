//
//  UIDevice+MQHardware.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/19.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import CoreTelephony

extension UIDevice {
        
    /// eg. "iPhone11,8"
    public var mq_identifier: String {
        var sysInfo = utsname()
        uname(&sysInfo)
        
        let machine = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(_SYS_NAMELEN))
        memcpy(machine, &sysInfo.machine, MemoryLayout.size(ofValue: sysInfo.machine))
        let identifierStr = String(cString: machine)
        free(machine)
        
        return identifierStr
    }
    
    /// eg. "iPhone 4s"
    public var mq_generation: String {
        // https://www.theiphonewiki.com/wiki/Models
        // https://gist.github.com/adamawolf/3048717
        let identifier = self.mq_identifier
        switch identifier {
        // MARK: - Apple Watch
        case "Watch1,1": return "Apple Watch (1st generation)"
        case "Watch1,2": return "Apple Watch (1st generation)"
            
        case "Watch2,6": return "Apple Watch Series 1"
        case "Watch2,7": return "Apple Watch Series 1"
            
        case "Watch2,3": return "Apple Watch Series 2"
        case "Watch2,4": return "Apple Watch Series 2"
            
        case "Watch3,1": return "Apple Watch Series 3"
        case "Watch3,2": return "Apple Watch Series 3"
        case "Watch3,3": return "Apple Watch Series 3"
        case "Watch3,4": return "Apple Watch Series 3"
            
        case "Watch4,1": return "Apple Watch Series 4"
        case "Watch4,2": return "Apple Watch Series 4"
        case "Watch4,3": return "Apple Watch Series 4"
        case "Watch4,4": return "Apple Watch Series 4"
            
        case "Watch5,1": return "Apple Watch Series 5"
        case "Watch5,2": return "Apple Watch Series 5"
        case "Watch5,3": return "Apple Watch Series 5"
        case "Watch5,4": return "Apple Watch Series 5"
            
        // MARK: - iPad
        case "iPad1,1": return "iPad"
            
        case "iPad2,1": return "iPad 2"
        case "iPad2,2": return "iPad 2"
        case "iPad2,3": return "iPad 2"
        case "iPad2,4": return "iPad 2"
            
        case "iPad3,1": return "iPad (3rd generation)"
        case "iPad3,2": return "iPad (3rd generation)"
        case "iPad3,3": return "iPad (3rd generation)"
            
        case "iPad3,4": return "iPad (4th generation)"
        case "iPad3,5": return "iPad (4th generation)"
        case "iPad3,6": return "iPad (4th generation)"
            
        case "iPad4,1": return "iPad Air"
        case "iPad4,2": return "iPad Air"
        case "iPad4,3": return "iPad Air"
            
        case "iPad5,3": return "iPad Air 2"
        case "iPad5,4": return "iPad Air 2"
            
        case "iPad6,7": return "iPad Pro (12.9-inch)"
        case "iPad6,8": return "iPad Pro (12.9-inch)"
            
        case "iPad6,3": return "iPad Pro (9.7-inch)"
        case "iPad6,4": return "iPad Pro (9.7-inch)"
            
        case "iPad6,11": return "iPad (5th generation)"
        case "iPad6,12": return "iPad (5th generation)"
            
        case "iPad7,1": return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
            
        case "iPad7,3": return "iPad Pro (10.5-inch)"
        case "iPad7,4": return "iPad Pro (10.5-inch)"
            
        case "iPad7,5": return "iPad (6th generation)"
        case "iPad7,6": return "iPad (6th generation)"
            
        case "iPad8,1": return "iPad Pro (11-inch)"
        case "iPad8,2": return "iPad Pro (11-inch)"
        case "iPad8,3": return "iPad Pro (11-inch)"
        case "iPad8,4": return "iPad Pro (11-inch)"
            
        case "iPad8,5": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,6": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,7": return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
            
        case "iPad11,3": return "iPad Air (3rd generation)"
        case "iPad11,4": return "iPad Air (3rd generation)"
            
        // MARK: - iPhone
        case "iPhone1,1": return "iPhone"
            
        case "iPhone1,2": return "iPhone 3G"
            
        case "iPhone2,1": return "iPhone 3GS"
            
        case "iPhone3,1": return "iPhone 4"
        case "iPhone3,2": return "iPhone 4"
        case "iPhone3,3": return "iPhone 4"
            
        case "iPhone4,1": return "iPhone 4S"
            
        case "iPhone5,1": return "iPhone 5"
        case "iPhone5,2": return "iPhone 5"
            
        case "iPhone5,3": return "iPhone 5c"
        case "iPhone5,4": return "iPhone 5c"
            
        case "iPhone6,1": return "iPhone 5s"
        case "iPhone6,2": return "iPhone 5s"
            
        case "iPhone7,2": return "iPhone 6"
        case "iPhone7,1": return "iPhone 6 Plus"
            
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
            
        case "iPhone8,4": return "iPhone SE"
            
        case "iPhone9,1": return "iPhone 7"
        case "iPhone9,3": return "iPhone 7"
        case "iPhone9,2": return "iPhone 7 Plus"
        case "iPhone9,4": return "iPhone 7 Plus"
            
        case "iPhone10,1": return "iPhone 8"
        case "iPhone10,4": return "iPhone 8"
        case "iPhone10,2": return "iPhone 8 Plus"
        case "iPhone10,5": return "iPhone 8 Plus"
        case "iPhone10,3": return "iPhone X"
        case "iPhone10,6": return "iPhone X"
            
        case "iPhone11,8": return "iPhone XR"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4": return "iPhone XS Max"
        case "iPhone11,6": return "iPhone XS Max"
            
        case "iPhone12,1": return "iPhone 11"
        case "iPhone12,3": return "iPhone 11 Pro"
        case "iPhone12,5": return "iPhone 11 Pro Max"
            
        // MARK: - iPod touch
        case "iPod1,1": return "iPod touch"
        case "iPod2,1": return "iPod touch (2nd generation)"
        case "iPod3,1": return "iPod touch (3rd generation)"
        case "iPod4,1": return "iPod touch (4th generation)"
        case "iPod5,1": return "iPod touch (5th generation)"
        case "iPod7,1": return "iPod touch (6th generation)"
        case "iPod9,1": return "iPod touch (7th generation)"
            
        // MARK: - Simulator
        case "i386":   return "Simulator"
        case "x86_64": return "Simulator"
        default: break
        }
        
        return identifier.count > 0 ? identifier : "Unknown"
    }
    
    private static var mq_privateTotalCapacity: UInt64 = 0
    public var mq_totalCapacity: UInt64 {
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
    
    public var mq_availableCapacity: UInt64 {
        var info = statfs()
        guard statfs("/var", &info) == 0 else {
            return 0
        }
        
        return info.f_bavail * UInt64(info.f_bsize)
    }
    
    public var mq_totalMemory: UInt64 {
        return ProcessInfo.processInfo.physicalMemory
    }
    
    /// less than actual value
    public var mq_availableMemory: UInt64 {
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
    
    public var mq_cpuThreads: Int {
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
    public var mq_isPad: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
}
