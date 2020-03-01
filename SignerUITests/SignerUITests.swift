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
        let firstName = app.textFields.element(matching: .textField, identifier: "firstName")
    }
}
