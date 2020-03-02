//
//  SignatureWireframe.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SignatureWireframe: SignatureWireframeProtocol {
    static let storyboardId = "Signature"
    static let viewId = "SignatureViewController"

    static func presentSignatureModule(vc: UIViewController, message: String) {
        let view: SignatureViewController = StoryboardUtil.instantiateView(storyboardId,
                                                              viewId)
        let presenter = SignaturePresenter()
        let interactor = SignatureInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.message = message
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
}
