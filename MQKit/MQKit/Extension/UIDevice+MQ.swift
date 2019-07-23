//
//  UIDevice+MQ.swift
//  MQKit
//
//  Created by M_Quadra on 2019/6/27.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var mq_isJailbroken: Bool {// just copy and exit(0) !!!
        #if targetEnvironment(simulator)
        return false;
        #endif
        
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
}
