//
//  SignaturePresenter.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class SignaturePresenter: SignaturePresenterProtocol {
    var interactor: SignatureInteracterProtocol?
    var view: SignatureViewControllerProtocol?
    var wireframe: SignatureWireframeProtocol?
    
    var message: String?
    
    func getQRCode() {
        guard let qrCodeImage = interactor?.getQRCode(),
            let messageString = message else {
            return
        }
        view?.setQRImage(image: qrCodeImage)
        view?.setMessage(message: "Message: \(messageString)")
    }
}
