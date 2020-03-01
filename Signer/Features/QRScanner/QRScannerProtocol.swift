//
//  QRScannerProtocol.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation


protocol QRScannerViewControllerProtocol: class {
    var presenter: QRScannerPresenterProtocol? { get set }

    func showAlert(message: String, title: String)
}

protocol QRScannerPresenterProtocol: class {
    var view: QRScannerViewControllerProtocol? { get set }
    var wireframe: QRScannerWireframeProtocol? { get set }
    
    func matchMessage(scannedMessage: String)
}

protocol QRScannerWireframeProtocol: class {
    var presenter: QRScannerPresenterProtocol? { get set }
}
