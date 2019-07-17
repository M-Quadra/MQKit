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
    
}
