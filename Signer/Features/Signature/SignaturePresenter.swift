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
    weak var view: SignatureViewControllerProtocol?
    
    var message: String?
    
    func getQRCode() {
        guard let messageString = message else {
            view?.hideLoadingIndicator()
            return
        }
        interactor?.getQRCode(completion: { [weak self] qrCodeImage in
            guard let image = qrCodeImage else {
                self?.view?.hideLoadingIndicator()
                return
            }
            self?.view?.setQRImage(image: image)
            self?.view?.setMessage(message: String.init(format: Constants.message, messageString))
        })
    }
}
