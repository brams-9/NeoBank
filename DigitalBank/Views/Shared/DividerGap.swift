//
//  DividerGap.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 21/07/24.
//

import UIKit

class DividerGap: UIView {
    init(in parentView: UIView, height: CGFloat = 24, backgroundColor: UIColor = .lightGray) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .lightGray
    }
}
