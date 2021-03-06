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
        guard let privateKey = forKey else {
            view?.hideLoadingIndicator()
            return
        }
        interactor?.getAccountDetails(privateKey:
            privateKey, completion: { [weak self] wallet in
            guard let ethWallet = wallet else {
                self?.view?.hideLoadingIndicator()
                return
            }
            self?.view?.showWalletDetails(walletDetails: ethWallet)
        })
    }
    
    func signClicked() {
        wireframe?.presentSignModule()
    }
    
    func verifyClicked() {
        wireframe?.presentVerificationModule()
    }
}
