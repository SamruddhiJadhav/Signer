//
//  SetupAccountWireframeMock.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

@testable import Signer
import XCTest

class SetupAccountWireframeMock: SetupAccountWireframeProtocol {

    var presenter: SetupAccountPresenterProtocol?
    var expectations = [XCTestExpectation]()

    func presentSignModule() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }

    func presentVerificationModule() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
