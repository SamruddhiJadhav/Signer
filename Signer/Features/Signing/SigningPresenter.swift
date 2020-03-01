//
//  SigningPresenter.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class SigningPresenter: SigningPresenterProtocol {
    weak var view: SigningViewControllerProtocol?
    var wireframe: SigningWireframeProtocol?
    
    func signMessageClicked(message: String?) {
        guard let message = message else {
            return
        }
        wireframe?.presentSignatureModule(message: message)
    }
}
