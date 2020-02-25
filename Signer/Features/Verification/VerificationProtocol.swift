//
//  VerificationProtocol.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

protocol VerificationViewControllerProtocol: class {
    var presenter: VerificationPresenterProtocol? { get set }
}

protocol VerificationPresenterProtocol: class {
    var view: VerificationViewControllerProtocol? { get set }
    var wireframe: VerificationWireframeProtocol? { get set }
    
    func vefiryMessage(message: String?)
}

protocol VerificationWireframeProtocol: class {
    var presenter: VerificationPresenterProtocol? { get set }
    
    func presentScannerModule(message: String)
}
