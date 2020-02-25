//
//  SetupAccountPresenter.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class SetupAccountPresenter: SetupAccountPresenterProtocol {
    weak var view: SetupAccountViewControllerProtocol?
    var wireframe: SetupAccountWireframeProtocol?
    var interactor: SetupAccountInteracterProtocol?
    
    func getAccountDetails(forKey: String?) {
        guard let privateKey = forKey,
            let wallet = interactor?.getAccountDetails(privateKey:
                privateKey) else {
            return
        }
        view?.showWalletDetails(walletDetails: wallet)
    }
    
    func signClicked() {
        wireframe?.presentSignModule()
    }
    
    func verifyClicked() {
        wireframe?.presentVerificationModule()
    }
}
