//
//  VerificationViewController.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController, VerificationViewControllerProtocol {
    var presenter: VerificationPresenterProtocol?
    
    @IBOutlet var messageTextField: UITextField!
    
    @IBAction func verifyClicked(_ sender: Any) {
        presenter?.vefiryMessage(message: messageTextField.text)
    }
}
