//
//  SignatureViewController.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SignatureViewController: UIViewController, SignatureViewControllerProtocol {
    var presenter: SignaturePresenterProtocol?
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var qrCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getQRCode()
    }
    
    func setQRImage(image: UIImage) {
        qrCodeImageView.image = image
    }
    
    func setMessage(message: String) {
        messageLabel.text = message
    }
}
