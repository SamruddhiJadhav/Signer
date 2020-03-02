//
//  SignatureProtocol.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

protocol SignatureViewControllerProtocol: class {
    var presenter: SignaturePresenterProtocol? { get set }
    
    func setQRImage(image: UIImage)
    func setMessage(message: String)
    func hideLoadingIndicator()
}

protocol SignaturePresenterProtocol: class {
    var view: SignatureViewControllerProtocol? { get set }
    var interactor: SignatureInteracterProtocol? { get set }
    
    var message: String? { get set }
    
    func getQRCode()
}

protocol SignatureWireframeProtocol: class {}

protocol SignatureInteracterProtocol: class {
    var presenter: SignaturePresenterProtocol? { get }
    
    func getQRCode(completion: @escaping (UIImage?) -> Void)
}
