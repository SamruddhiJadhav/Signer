//
//  VerificationPresenter.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class VerificationPresenter: VerificationPresenterProtocol {
    var view: VerificationViewControllerProtocol?
    var wireframe: VerificationWireframeProtocol?
    
    func vefiryMessage(message: String?) {
        guard let messageString = message else {
            return
        }
        
        wireframe?.presentScannerModule(message: messageString)
    }
}
