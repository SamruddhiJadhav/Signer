//
//  SignatureInteractor.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SignatureInteractor: SignatureInteracterProtocol {
    weak var presenter: SignaturePresenterProtocol?
    
    func getQRCode() -> UIImage? {
        guard let message = presenter?.message else {
            return nil
        }
        if let signedData = Web3SwiftManager.sharedInstance.signPersonalMessage(message:
            message) {
            return QRCodeGenerator.shared.generateQRCode(message: signedData)
        }
        return nil
    }
}
