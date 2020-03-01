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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func setup() {
        privateKeyTextField.delegate = self
        privateKeyTextField.addKeyboardWithDoneButton()
    }

    @IBAction func setupClicked(_ sender: Any) {
        presenter?.getAccountDetails(forKey: privateKeyTextField.text)
        privateKeyTextField.resignFirstResponder()
    }
    
    @IBAction func signClicked(_ sender: Any) {
        presenter?.signClicked()
    }
    
    @IBAction func verifyClicked(_ sender: Any) {
        presenter?.verifyClicked()
    }
    
    func showWalletDetails(walletDetails: EthereumWallet) {
        accountsView.isHidden = false
        setupView.isHidden = true

        titleLabel.text = Constants.account
        addressLabel.text = walletDetails.address
        balanceLabel.text = walletDetails.balance
    }
}

extension SetupAccountViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter?.getAccountDetails(forKey: textField.text)
    }
}
