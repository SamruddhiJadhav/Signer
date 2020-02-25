//
//  QRScannerPresenter.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

class QRScannerPresenter: QRScannerPresenterProtocol {
    var view: QRScannerViewControllerProtocol?
    var wireframe: QRScannerWireframeProtocol?
    
    var message: String?
    
    func matchMessage(scannedMessage: String) {
        guard let messageString = message else {
            print("Error")
            return
        }
        
        if messageString == scannedMessage {
            print("Yes")
        } else {
            print("No")
        }
    }
    
}
