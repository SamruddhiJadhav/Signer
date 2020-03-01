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

    func testSetupAndAccount() {
        let setupButton = app.buttons.element(matching: .button, identifier: "SetupButton")
        if setupButton.waitForExistence(timeout: 5.0) {
            let privateKey = app.textFields.element(matching: .textField, identifier: "privateKeyLabel")
            privateKey.tap()
            privateKey.typeText("0xa2ae25c5b887bb427e6adc7cccbbd10329c80ae8cd81c25675b26a06aa669ba1")
            setupButton.tap()
        }
    }
}
