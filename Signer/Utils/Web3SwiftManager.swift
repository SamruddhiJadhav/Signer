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
    
    func getBalanceAndAddress() -> EthereumWallet? {
        guard let privateKey = privateKey else { return nil }

        if let privateKeyData = Data.fromHex(privateKey) {
            guard let keyStore = try? EthereumKeystoreV3(privateKey: privateKeyData),
                let ethAddress = keyStore.getAddress(),
                let balanceResult = try? web3Rinkeby.eth.getBalance(address: ethAddress),
                let balanceString = Web3.Utils.formatToEthereumUnits(balanceResult, toUnits: .eth, decimals: 3) else {
                    return nil
            }
            walletAddress = ethAddress.address
            return EthereumWallet(address: ethAddress.address, balance: balanceString + Constants.eth)
        }
        return nil
    }

    func signPersonalMessage(message: String) -> Data? {
        guard let privateKey = privateKey,
            let privateKeyData = Data.fromHex(privateKey),
            let keystore = try? EthereumKeystoreV3(privateKey:
                privateKeyData) else {
            return nil
        }
        let keystoreManager = KeystoreManager([keystore])
        web3Rinkeby.addKeystoreManager(keystoreManager)
        guard let addresses = keystoreManager.addresses else { return nil }
        do {
            guard let messageData = message.data(using: .utf8) else { return nil }
            let signedData = try web3Rinkeby.personal.signPersonalMessage(message: messageData, from: addresses[0])
            let signedBase64Data = signedData.base64EncodedData()
            return signedBase64Data
        } catch {
            return nil
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
