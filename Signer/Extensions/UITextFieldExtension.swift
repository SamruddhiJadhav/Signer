//
//  UITextFieldExtension.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import Foundation

import UIKit

extension UITextField {
    func addKeyboardWithDoneButton() {
        let doneButtonToolBar = UIToolbar(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: frame.width,
                                                        height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target:self,
                                            action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(endEdit))
        doneButtonToolBar.setItems([flexibleSpace, doneButton],
                                   animated: true)
        doneButtonToolBar.sizeToFit()
        inputAccessoryView = doneButtonToolBar
    }
    
    @objc func endEdit() {
        resignFirstResponder()
    }
}
