//
//  SigningViewController.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SigningViewController: UIViewController, SigningViewControllerProtocol {
    var presenter: SigningPresenterProtocol?
    
    @IBOutlet var messageTextField: UITextField!
    
    @IBAction func signMessageClicked(_ sender: Any) {
        messageTextField.resignFirstResponder()
        presenter?.signMessageClicked(message: messageTextField.text)
    }
}
