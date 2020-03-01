//
//  SetupAccountViewControllerMock.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import XCTest
@testable import Signer

class SetupAccountViewControllerMock: SetupAccountViewControllerProtocol {
    var presenter: SetupAccountPresenterProtocol?
    var expectations = [XCTestExpectation]()

    func showWalletDetails(walletDetails: EthereumWallet) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
