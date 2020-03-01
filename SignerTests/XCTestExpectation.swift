//
//  XCTestExpectation.swift
//  SignerTests
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import XCTest

extension XCTestExpectation {
    static let expectationTimeout = 0.5

    static func fulfill(with fulfilledDescription: String, from expectations: [XCTestExpectation]) {
        for testExpectation in expectations {
            if testExpectation.expectationDescription == fulfilledDescription {
                testExpectation.fulfill()
            }
        }
    }
    
}
