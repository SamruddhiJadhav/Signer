//
//  SigningWireframe.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SigningWireframe: SigningWireframeProtocol {
    var presenter: SigningPresenterProtocol?
    
    
    static let storyboardId = "Signing"
    static let viewId = "SigningViewController"

    static func presentSetupAccountModule(vc: UIViewController) {
        let view: SigningViewController = StoryboardUtil.instantiateView(storyboardId,
                                                              viewId)
        let presenter = SigningPresenter()
        let wireframe = SigningWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    func presentSignatureModule(message: String) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        SignatureWireframe.presentSignatureModule(vc: view, message: message)
    }
}
