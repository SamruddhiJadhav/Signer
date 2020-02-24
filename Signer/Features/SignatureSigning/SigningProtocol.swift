//
//  SigningProtocol.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

protocol SigningViewControllerProtocol: class {
    var presenter: SigningPresenterProtocol? { get set }
}

protocol SigningPresenterProtocol: class {
    var view: SigningViewControllerProtocol? { get set }
    var wireframe: SigningWireframeProtocol? { get set }
    
    func signMessageClicked(message: String?)
}

protocol SigningWireframeProtocol: class {
    var presenter: SigningPresenterProtocol? { get set }
    
    func presentSignatureModule(message: String)
}
