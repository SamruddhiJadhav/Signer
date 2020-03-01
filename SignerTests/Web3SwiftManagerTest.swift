//
//  Web3SwiftManagerTest.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 01/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import XCTest
@testable import Signer

class Web3SwiftManagerTest: XCTestCase {

    var validWallet: EthereumWallet?
    var invalidWallet: EthereumWallet?

    override func setUp() {
        Web3SwiftManager.sharedInstance.privateKey = "0xa2ae25c5b887bb427e6adc7cccbbd10329c80ae8cd81c25675b26a06aa669ba1"
        validWallet = EthereumWallet(address: "0xbfE01Ff0Eb907423ea20756eBB4a82a8C36F6336", balance: "18.750 ETH")
        invalidWallet = EthereumWallet(address: "0xbE01Ff0Eb907423ea20756eBB4a82a8C36F6336", balance: "18.70 ETH")
    }

    func testGetBalanceAndAddress() {
        let wallet = Web3SwiftManager.sharedInstance.getBalanceAndAddress()
        XCTAssertEqual(wallet, validWallet)
        XCTAssertNotEqual(wallet, invalidWallet)

        Web3SwiftManager.sharedInstance.privateKey = nil
    }

    func testSignPersonalMessage() {
        let sign = Web3SwiftManager.sharedInstance.signPersonalMessage(message: "message")
        XCTAssertNotNil(sign, "Could not sign")
    }

    func testValidatePersonalMessage() {
        let result = Web3SwiftManager.sharedInstance.validatePersonalMessage(message: "message", qrResultString: "string")
        XCTAssertFalse(result)

        if let signedData = Web3SwiftManager.sharedInstance.signPersonalMessage(message: "message"), let signedString = String(data: signedData, encoding: .utf8) {
            XCTAssertTrue(Web3SwiftManager.sharedInstance.validatePersonalMessage(message: "message", qrResultString: signedString))
        }
    }
}
