//
//  CustomChips.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 17/07/24.
//

import UIKit

enum ChipsType {
case PopularChip
case TintedChip
}

class ChipView: UIView {
    private var chipType: ChipsType?
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    init(text: String, chipTypeValue: ChipsType) {
        super.init(frame: .zero)
        chipType = chipTypeValue
        setupView()
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(label)

        switch chipType {
        case .PopularChip:
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 2),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
            ])
            label.textColor = .white
            backgroundColor = .infoColor
            layer.cornerRadius = 10
            clipsToBounds = true
        case .TintedChip:
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
            ])
            label.textColor = .titleColor
            backgroundColor = .tintColor
            
            layer.cornerRadius = 18
            clipsToBounds = true
        case .none:
            break
        }
    }
}
