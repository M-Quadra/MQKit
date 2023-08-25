//
//  Crypto+CC.swift
//  MQKit
//
//  Created by m_quadra on 2022/11/9.
//  Copyright © 2022 M_noAria. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: - CCOperation
extension Crypto {
    
    enum CCOperation {
        case encrypt, decrypt
        
        var rawValue: UInt32 {
            switch self {
            case .encrypt: return UInt32(kCCEncrypt)
            case .decrypt: return UInt32(kCCDecrypt)
            }
        }
    }
}

// MARK: - CCAlgorithm
extension Crypto {
    
    enum CCAlgorithm {
        case aes, des, tripleDES, cast, rc4, rc2, blowfish
        
        var rawValue: UInt32 {
            switch self {
            case .aes: return UInt32(kCCAlgorithmAES)
            case .des: return UInt32(kCCAlgorithmDES)
            case .tripleDES: return UInt32(kCCAlgorithm3DES)
            case .cast: return UInt32(kCCAlgorithmCAST)
            case .rc4: return UInt32(kCCAlgorithmRC4)
            case .rc2: return UInt32(kCCAlgorithmRC2)
            case .blowfish: return UInt32(kCCAlgorithmBlowfish)
            }
        }
    }
}

// MARK: - CCOptions
extension Crypto {
    
    struct CCOptions: OptionSet {
        let rawValue: UInt32

        static let pkcs7Padding = CCOptions(rawValue: UInt32(kCCOptionPKCS7Padding))
        static let ebcMode = CCOptions(rawValue: UInt32(kCCOptionECBMode))
    }
}

// MARK: - CCCryptorStatus
extension Crypto {
    
    enum Errors: Error {
        case paramError
        case bufferTooSmall
        case memoryFailure
        case alignmentError
        case decodeError
        case unimplemented
        case overflow
        case rngFailure
        case unspecifiedError
        case callSequenceError
        case keySizeError
        
        static func from(_ rawValue: Int32) -> Errors? {
            switch Int(rawValue) {
                case kCCParamError: return .paramError
                case kCCBufferTooSmall: return .bufferTooSmall
                case kCCMemoryFailure: return .memoryFailure
                case kCCAlignmentError: return .alignmentError
                case kCCDecodeError: return .decodeError
                case kCCUnimplemented: return .unimplemented
                case kCCOverflow: return .overflow
                case kCCRNGFailure: return .rngFailure
                case kCCUnspecifiedError: return .unspecifiedError
                case kCCCallSequenceError: return .callSequenceError
                case kCCKeySizeError: return .keySizeError
                default: return nil
            }
        }
    }
}

// MARK: - CCCrypt
extension Crypto {
    
    @discardableResult
    static func CCCrypt(
        op: CCOperation,
        alg: CCAlgorithm,
        options: CCOptions,
        key: Data,
        iv: UnsafeRawPointer,
        dataIn: Data,
        dataOut: UnsafeMutableRawPointer, dataOutAvailavle: Int
    ) throws -> Int {
        var moved = 0
        
        let result = try key.withUnsafeBytes{ ptr in
            guard let keyPtr = ptr.baseAddress else { throw Errors.paramError }
            let keyLength = ptr.count

            return try dataIn.withUnsafeBytes({ ptr in
                guard let dataInPtr = ptr.baseAddress else { throw Errors.paramError }
                let dataInLength = ptr.count
                
                return CommonCrypto.CCCrypt(
                    op.rawValue,
                    alg.rawValue,
                    options.rawValue,
                    keyPtr, keyLength,
                    iv,
                    dataInPtr, dataInLength,
                    dataOut, dataOutAvailavle,
                    &moved
                )
            })
        }
        if result != kCCSuccess {
            throw Errors.from(result) ?? .paramError
        }
        
        return moved
    }
}
