//
//  SignerUITests.swift
//  SignerUITests
//
//  Created by Samruddhi on 22/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import XCTest

class SignerUITests: XCTestCase {

    var app = XCUIApplication()

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    func testSetup() {
        let setupButton = app.buttons.element(matching: .button, identifier: "SetupButton")
        if setupButton.waitForExistence(timeout: 5.0) {
            let privateKey = app.textFields.element(matching: .textField, identifier: "privateKeyLabel")
            privateKey.tap()
            privateKey.typeText("0xa2ae25c5b887bb427e6adc7cccbbd10329c80ae8cd81c25675b26a06aa669ba1")
            setupButton.tap()
        }
    }

    func testAccount() {
        testSetup()

        let signButton = app.buttons.element(matching: .button, identifier: "SignButton")
        let verifyButton = app.buttons.element(matching: .button, identifier: "VerifyButton")

        if signButton.waitForExistence(timeout: 5.0) && verifyButton.waitForExistence(timeout: 5.0) {
            XCTAssert(app.staticTexts["Address"].exists)
            XCTAssert(app.staticTexts["Balance"].exists)
        }
    }

    func testSign() {
        testAccount()

        let signButton = app.buttons.element(matching: .button, identifier: "SignButton")
        if signButton.waitForExistence(timeout: 5.0) {
            signButton.tap()
            let message = app.textFields.element(matching: .textField, identifier: "messageTextFiled")
            message.tap()
            message.typeText("message")

            let signMessageButton = app.buttons.element(matching: .button, identifier: "SignMessageButton")
            signMessageButton.tap()
        }
    }

    func testVerify() {
        testAccount()

        let verifyButton = app.buttons.element(matching: .button, identifier: "VerifyButton")
        if verifyButton.waitForExistence(timeout: 5.0) {
            verifyButton.tap()
            let message = app.textFields.element(matching: .textField, identifier: "MessageTextField")
            message.tap()
            message.typeText("message")

            let signMessageButton = app.buttons.element(matching: .button, identifier: "VerifyMessageButton")
            signMessageButton.tap()
        }
    }
}
