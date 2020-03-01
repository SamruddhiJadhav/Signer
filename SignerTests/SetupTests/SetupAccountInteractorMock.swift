//
//  SetupAccountInteractorMock.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

@testable import Signer
import XCTest

class SetupAccountInteractorMock: SetupAccountInteracterProtocol {
    var presenter: SetupAccountPresenterProtocol?

    func getAccountDetails(privateKey: String) -> EthereumWallet? {
        return EthereumWallet(address: "Address", balance: "25 ETH")
    }
}
