//
//  CryptoTests.swift
//  
//
//  Created by m_quadra on 2023/8/28.
//

import Foundation
import XCTest
import MQKit

fileprivate class CryptoTests: XCTestCase {
    
    func testAES_CBC() throws {
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
}
