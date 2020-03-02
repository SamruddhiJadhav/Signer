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
    
    func getQRCode(completion: @escaping (UIImage?) -> Void) {
        guard let message = presenter?.message else {
            completion(nil)
            return
        }
        Web3SwiftManager.sharedInstance.signPersonalMessage(message:
            message, completion: { data in
            guard let signedData = data else {
                completion(nil)
                return
            }
            completion(QRCodeGenerator.shared.generateQRCode(message: signedData))
        })
    }
}
