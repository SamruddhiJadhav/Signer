//
//  LoadingIndicator.swift
//  Signer
//
//  Created by Samruddhi.Jadhav on 02/03/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

struct LoadingIndicator {
    static let loadingIndicatorView = UIView()
    static let loadingIndicator = UIActivityIndicatorView(style: .white)

    static func setupLoadingIndicator(frame: CGRect) -> UIView {
        loadingIndicatorView.frame = frame
        loadingIndicatorView.backgroundColor = .white
        loadingIndicatorView.isHidden = true

        loadingIndicator.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        loadingIndicator.color = .gray
        loadingIndicator.hidesWhenStopped = true
        loadingIndicatorView.addSubview(loadingIndicator)
        return loadingIndicatorView
    }

    static func showLoadingIndicator() {
        self.loadingIndicator.startAnimating()
        self.loadingIndicatorView.isHidden = false
    }

    static func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicatorView.isHidden = true
        }
    }
}
