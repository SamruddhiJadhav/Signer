//
//  SetupAccountViewController.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class SetupAccountViewController: UIViewController, SetupAccountViewControllerProtocol {
    var presenter: SetupAccountPresenterProtocol?
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var setupView: UIView!
    @IBOutlet var privateKeyTextField: UITextField!
    
    
    @IBOutlet var accountsView: UIView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        privateKeyTextField.delegate = self
        privateKeyTextField.addKeyboardWithDoneButton()
    }
    
    @IBAction func signClicked(_ sender: Any) {
    
    }
    
    @IBAction func verifyClicked(_ sender: Any) {
    
    }
    
    func showWalletDetails(walletDetails: EthereumWallet) {
        accountsView.isHidden = false
        setupView.isHidden = true
        
        addressLabel.text = walletDetails.address
        balanceLabel.text = walletDetails.balance
    }
}

extension SetupAccountViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter?.getAccountDetails(forKey: textField.text)
    }
}
