//
//  SetupAccountWireframe.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SetupAccountWireframe: SetupAccountWireframeProtocol {
    weak var presenter: SetupAccountPresenterProtocol?
    
    static let storyboardId = "Setup"
    static let viewId = "SetupAccountViewController"

    static func presentSetupAccountModule() -> UIViewController {
        let view: SetupAccountViewController = StoryboardUtil.instantiateView(storyboardId,
                                                              viewId)
        let presenter = SetupAccountPresenter()
        let wireframe = SetupAccountWireframe()
        let interactor = SetupAccountInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        wireframe.presenter = presenter
        interactor.presenter = presenter

        return view
    }
    
    func presentSignModule() {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        SigningWireframe.presentSetupAccountModule(vc: view)
    }
    
    func presentVerificationModule() {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        VerificationWireframe.presentVerificationModule(vc: view)
    }
}
