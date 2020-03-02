//
//  Web3SwiftManager.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

import Foundation
import web3swift

class Web3SwiftManager {
    static let sharedInstance = Web3SwiftManager()

    var walletAddress: String?
    var privateKey: String?

    private let web3Rinkeby = Web3.InfuraRinkebyWeb3()

    // Calls wait() on main thread in PromiseKit so calling on background thread
    func getBalanceAndAddress(completion: @escaping(EthereumWallet?) -> Void) {
        guard let privateKey = privateKey else {
            completion(nil)
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let privateKeyData = Data.fromHex(privateKey) {
                guard let keyStore = try? EthereumKeystoreV3(privateKey: privateKeyData),
                    let ethAddress = keyStore.getAddress(),
                    let balanceResult = try? self?.web3Rinkeby.eth.getBalance(address: ethAddress),
                    let balanceString = Web3.Utils.formatToEthereumUnits(balanceResult, toUnits: .eth, decimals: 3) else {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                        return
                }
                self?.walletAddress = ethAddress.address
                let wallet = EthereumWallet(address: ethAddress.address, balance: balanceString + Constants.eth)
                DispatchQueue.main.async {
                    completion(wallet)
                }
            }
            completion(nil)
        }
    }

    // Calls wait() on main thread in PromiseKit so calling on background thread
    func signPersonalMessage(message: String, completion: @escaping(Data?) -> Void) {
        guard let privateKey = privateKey,
            let privateKeyData = Data.fromHex(privateKey),
            let keystore = try? EthereumKeystoreV3(privateKey:
                privateKeyData) else {
            completion(nil)
            return
        }
        let keystoreManager = KeystoreManager([keystore])
        web3Rinkeby.addKeystoreManager(keystoreManager)
        guard let addresses = keystoreManager.addresses else {
            completion(nil)
            return
        }
        DispatchQueue.global().async { [weak self] in
            do {
                guard let messageData = message.data(using: .utf8) else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                let signedData = try self?.web3Rinkeby.personal.signPersonalMessage(message: messageData, from: addresses[0])
                let signedBase64Data = signedData?.base64EncodedData()
                DispatchQueue.main.async {
                    completion(signedBase64Data)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    func validatePersonalMessage(message: String, qrResultString: String) -> Bool {
        if let signature = Data(base64Encoded: qrResultString){
            guard let messageData = message.data(using: .utf8) else { return false }
            let signer = try? web3Rinkeby.personal.ecrecover(personalMessage: messageData, signature: signature)
            return signer?.address == walletAddress
        }
        return false
    }
}
