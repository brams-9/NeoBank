//
//  CustomTextfield.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 21/07/24.
//

import UIKit

class CustomTextfield: UITextField {
    var textPadding = UIEdgeInsets(
        top: 8,
        left: 8,
        bottom: 8,
        right: 8
    )
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.layer.borderColor = UIColor.subtleColor?.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Override the methods to adjust the text and placeholder positioning
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
