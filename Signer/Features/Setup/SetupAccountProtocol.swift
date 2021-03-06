//
//  SetupAccountProtocol.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

protocol SetupAccountViewControllerProtocol: class {
    var presenter: SetupAccountPresenterProtocol? { get set }
    
    func showWalletDetails(walletDetails: EthereumWallet)
    func hideLoadingIndicator() 
}

protocol SetupAccountPresenterProtocol: class {
    var view: SetupAccountViewControllerProtocol? { get set }
    var interactor: SetupAccountInteracterProtocol? { get set }
    var wireframe: SetupAccountWireframeProtocol? { get set }
    
    func getAccountDetails(forKey: String?)
    
    func signClicked()
    func verifyClicked()
}

protocol SetupAccountWireframeProtocol: class {
    var presenter: SetupAccountPresenterProtocol? { get set }
    
    func presentSignModule()
    func presentVerificationModule()
}

protocol SetupAccountInteracterProtocol: class {
    var presenter: SetupAccountPresenterProtocol? { get set }
    func getAccountDetails(privateKey: String, completion: @escaping(EthereumWallet?) -> Void)
}
