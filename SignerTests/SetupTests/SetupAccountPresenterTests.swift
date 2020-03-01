//
//  SetupAccountPresenterTests.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

@testable import Signer
import XCTest

class SetupAccountPresenterTests: XCTestCase {
    let interactorMock = SetupAccountInteractorMock()
    let wireframeMock = SetupAccountWireframeMock()
    let testPresenter = SetupAccountPresenter()
    let viewMock = SetupAccountViewControllerMock()

    override func setUp() {
        super.setUp()
        testPresenter.interactor = interactorMock
        testPresenter.wireframe = wireframeMock
        testPresenter.view = viewMock
    }

    func testGetAccountDetails() {
        viewMock.expectations.append(expectation(description: "showWalletDetails(walletDetails:)"))
        testPresenter.getAccountDetails(forKey: "0xa2ae25c5b887bb427e6adc7cccbbd10329c80ae8cd81c25675b26a06aa669ba1")
        wait(for: viewMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }

    func testSignClicked() {
        wireframeMock.expectations.append(expectation(description: "presentSignModule()"))
        testPresenter.signClicked()
        wait(for: wireframeMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }

    func testVerifyClicked() {
        wireframeMock.expectations.append(expectation(description: "presentVerificationModule()"))
        testPresenter.verifyClicked()
        wait(for: wireframeMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
}
