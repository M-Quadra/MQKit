//
//  UIDevice+MQSoftware.swift
//  MQKit
//
//  Created by M_Quadra on 2019/8/19.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit
import SystemConfiguration
import CoreTelephony

extension UIDevice {
    
    public var mq_isJailbroken: Bool {// just copy and exit(0) !!!
        #if targetEnvironment(simulator)
        return false;
        #else
        
        // file check
        let jailbreakToolPatheAry = ["/Applications/Cydia.app",
                                     "/bin/sh",
                                     "/bin/bash",
                                     "/etc/apt",
                                     "/etc/ssh/sshd_config",
                                     "/Library/MobileSubstrate/MobileSubstrate.dylib",
                                     "/private/var/lib/apt",
                                     "/usr/libexec/ssh-keysign",
                                     "/usr/sbin/sshd",
                                     "/var/cache/apt",
                                     "/var/lib/apt",
        ]
        
        var stat_info:stat = stat()
        for path in jailbreakToolPatheAry {
            if stat(path, &stat_info) == 0 || FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        
        //        https://stackoverflow.com/a/55643201
        var dylib_info = Dl_info()
        let RTLD_DEFAULT = UnsafeMutableRawPointer(bitPattern: -2)
        let func_stat = dlsym(RTLD_DEFAULT, "stat")
        if dladdr(func_stat, &dylib_info) == 1, let cStr = dylib_info.dli_fname {
            let dli_fname = String(cString: cStr)
            if dli_fname != "/usr/lib/system/libsystem_kernel.dylib" {
                return true
            }
        }
        
        let DYLD_INSERT_LIBRARIES = "DYLD_INSERT_LIBRARIES".cString(using: .ascii)
        if getenv(DYLD_INSERT_LIBRARIES) != nil {
            return true
        }
        
        return false
        #endif
    }
    
    public var mq_isDebug: Bool {
        let name = UnsafeMutablePointer<Int32>.allocate(capacity: 4)
        var info = kinfo_proc()
        var infoSize = MemoryLayout<kinfo_proc>.size
        
        name[0] = CTL_KERN
        name[1] = KERN_PROC
        name[2] = KERN_PROC_PID
        name[3] = getpid()
        
        info.kp_proc.p_flag = 0
        
        guard sysctl(name, 4, &info, &infoSize, nil, 0) == 0 else {
            return true
        }
        return info.kp_proc.p_flag & P_TRACED != 0
    }
    
    fileprivate static let networkTypeDic = [
        CTRadioAccessTechnologyGPRS: "2G", // 2.5G   171Kbps
        CTRadioAccessTechnologyEdge: "2G", // 2.75G  384Kbps
        
        CTRadioAccessTechnologyWCDMA:        "3G", // 3G     3.6Mbps/384Kbps
        CTRadioAccessTechnologyHSDPA:        "3G", // 3.5G   14.4Mbps/384Kbps
        CTRadioAccessTechnologyHSUPA:        "3G", // 3.75G  14.4Mbps/5.76Mbps
        CTRadioAccessTechnologyCDMA1x:       "3G", // 2.5G
        CTRadioAccessTechnologyCDMAEVDORev0: "3G",
        CTRadioAccessTechnologyCDMAEVDORevA: "3G",
        CTRadioAccessTechnologyCDMAEVDORevB: "3G",
        CTRadioAccessTechnologyeHRPD:        "3G",
        
        CTRadioAccessTechnologyLTE: "4G", // LTE:3.9G 150M/75M  LTE-Advanced:4G 300M/150M
    ]
    
    fileprivate static let reachability: SCNetworkReachability? = {
        var address = sockaddr()
        address.sa_len = __uint8_t(MemoryLayout<sockaddr>.size)
        address.sa_family = __uint8_t(AF_INET);
        return SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address)
    }()
    
    ///eg. "4G", "Wi-Fi"
    public var mq_networkType: String? {
        guard let reachability = UIDevice.reachability else {
            return nil
        }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        let flagsValue = flags.rawValue
        
        if flagsValue & SCNetworkReachabilityFlags.reachable.rawValue == 0 {
            return nil
        }
        if flagsValue&SCNetworkReachabilityFlags.connectionRequired.rawValue > 0 &&
           flagsValue&SCNetworkReachabilityFlags.transientConnection.rawValue > 0 {
            return nil
        }
        
        if flagsValue & SCNetworkReachabilityFlags.isWWAN.rawValue > 0 {
            let info = CTTelephonyNetworkInfo()
            guard let technology = info.currentRadioAccessTechnology else {
                return nil
            }
            guard let type = UIDevice.networkTypeDic[technology] else {
                return nil
            }
            return type
        }
        
        return "Wi-Fi"
    }
}
