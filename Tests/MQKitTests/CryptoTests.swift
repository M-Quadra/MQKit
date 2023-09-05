//
//  CryptoTests.swift
//  
//
//  Created by m_quadra on 2023/8/28.
//

import Foundation
import XCTest
import MQKit

final class CryptoTests: XCTestCase {
    
    func testAES_ECB() throws {
        let key = Data([UInt8].random(16))
        let msg = "hello world"
        
        guard let ciphertext0 = Crypto.AES.ECB.encrypt(Data(msg.utf8), key: key),
              let ciphertext1 = Crypto.AES.ECB.encrypt(Data(msg.utf8), key: key)
        else {
            XCTFail("encrypt error")
            return
        }
        XCTAssertEqual(ciphertext0, ciphertext1)
        
        guard let plaintext = Crypto.AES.ECB.decrypt(ciphertext0, key: key)
        else {
            XCTFail("decrypt error")
            return
        }
        XCTAssertEqual(plaintext, Data(msg.utf8))
    }
    
    func testTripleDES_CBC() throws {
        let key = Data([UInt8].random(24))
        let iv = Data([UInt8].random(8))
        let msg = "hello world"
        
        guard let ciphertext0 = Crypto.TripleDES.CBC.encrypt(Data(msg.utf8), key: key),
              let ciphertext1 = Crypto.TripleDES.CBC.encrypt(Data(msg.utf8), key: key, iv: iv)
        else {
            XCTFail("encrypt error")
            return
        }
        XCTAssertNotEqual(ciphertext0, ciphertext1)
        
        guard let plaintext0 = Crypto.TripleDES.CBC.decrypt(ciphertext0, key: key),
              let plaintext1 = Crypto.TripleDES.CBC.decrypt(ciphertext1, key: key, iv: iv)
        else {
            XCTFail("decrypt error")
            return
        }
        XCTAssertEqual(plaintext0, Data(msg.utf8))
        XCTAssertEqual(plaintext1, Data(msg.utf8))
    }
}
