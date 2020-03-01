//
//  VerificationWireframe.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class VerificationWireframe: VerificationWireframeProtocol {
    weak var presenter: VerificationPresenterProtocol?
    
    static let storyboardId = "Verification"
    static let viewId = "VerificationViewController"
    
    static func presentVerificationModule(vc: UIViewController) {
        let view: VerificationViewController = StoryboardUtil.instantiateView(storyboardId,
                                                           viewId)
        let presenter = VerificationPresenter()
        let wireframe = VerificationWireframe()
     
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    func presentScannerModule(message: String) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        QRScannerWireframe.presentQRScanner(vc: view, message: message)
    }
}
