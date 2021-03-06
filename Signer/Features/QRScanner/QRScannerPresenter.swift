//
//  QRScannerPresenter.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class QRScannerPresenter: QRScannerPresenterProtocol {
    weak var view: QRScannerViewControllerProtocol?

    var swiftManager: Web3SwiftManager
    var message: String?
    
    init(swiftManager: Web3SwiftManager = Web3SwiftManager()) {
        self.swiftManager = swiftManager
    }
    
    func matchMessage(scannedMessage: String) {
        guard let messageString = message else {
            view?.showAlert(message: Constants.messageEmpty, title: Constants.failed)
            return
        }
        
        if Web3SwiftManager.sharedInstance.validatePersonalMessage(message: messageString,
                                                                   qrResultString: scannedMessage) {
            view?.showAlert(message: Constants.signatureValid,
                            title: Constants.succeed)
        } else {
            view?.showAlert(message: Constants.signatureInvalid,
                            title: Constants.failed)
        }
    }
}
