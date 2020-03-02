//
//  QRScannerWireframe.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class QRScannerWireframe: QRScannerWireframeProtocol {
    weak var presenter: QRScannerPresenterProtocol?
    
    static func presentQRScanner(vc: UIViewController, message: String) {
        let view: QRScannerViewController = QRScannerViewController()
        let presenter = QRScannerPresenter()
        let wireframe = QRScannerWireframe()
        
        view.presenter = presenter
        presenter.view = view
        wireframe.presenter = presenter
        presenter.message = message
           
        vc.navigationController?.pushViewController(view, animated: true)
    }
}
