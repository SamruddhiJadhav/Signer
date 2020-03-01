//
//  EtheriumWallet.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

struct EthereumWallet {
    var address: String
    var balance: String
}

extension EthereumWallet: Equatable {
    static func == (lhs: EthereumWallet, rhs: EthereumWallet) -> Bool {
        return (lhs.address == rhs.address) && (lhs.balance == rhs.balance)
    }
}
