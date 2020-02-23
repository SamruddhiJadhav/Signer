//
//  SetupAccountInteractor.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class SetupAccountInteractor: SetupAccountInteracterProtocol {
    weak var presenter: SetupAccountPresenterProtocol?
    
    func getAccountDetails(privateKey: String) -> EthereumWallet? {
        Web3SwiftManager.sharedInstance.privateKey = privateKey
        return Web3SwiftManager.sharedInstance.getBalanceAndAddress()
    }
}
