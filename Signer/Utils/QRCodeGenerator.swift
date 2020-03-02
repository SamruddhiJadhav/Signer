//
//  QRCodeGenerator.swift
//  Signer
//
//  Created by Samruddhi on 24/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class QRCodeGenerator {
    static let shared = QRCodeGenerator()
    private let filterName = "CIQRCodeGenerator"
    private let filterKey = "inputMessage"
    
    func generateQRCode(message: Data) -> UIImage? {
        if let filter = CIFilter(name: filterName) {
            filter.setValue(message, forKey: filterKey)
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
