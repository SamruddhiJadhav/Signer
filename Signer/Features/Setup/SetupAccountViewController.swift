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
        view.addSubview(LoadingIndicator.setupLoadingIndicator(frame: view.frame))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func setupClicked(_ sender: Any) {
        LoadingIndicator.showLoadingIndicator()
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
        LoadingIndicator.hideLoadingIndicator()
        
        accountsView.isHidden = false
        setupView.isHidden = true

        titleLabel.text = Constants.account
        addressLabel.text = walletDetails.address
        balanceLabel.text = walletDetails.balance
    }

    func hideLoadingIndicator() {
        LoadingIndicator.hideLoadingIndicator()
    }
}
