//
//  ProductDetailViewLayoutSetup.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 21/07/24.
//

import UIKit

extension ProductDetailViewController {
    func setupLayout() {
        view.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        view.addSubview(productRateInformationStackView)
        productRateInformationStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16).isActive = true
        productRateInformationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        view.addSubview(productDescriptionLabel)
        productDescriptionLabel.topAnchor.constraint(equalTo: productRateInformationStackView.bottomAnchor, constant: 16).isActive = true
        productDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        productDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        view.addSubview(dividerGap)
        dividerGap.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 24).isActive = true
        dividerGap.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dividerGap.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(insertAmountLabel)
        insertAmountLabel.topAnchor.constraint(equalTo: dividerGap.bottomAnchor, constant: 24).isActive = true
        insertAmountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        view.addSubview(amountTextField)
        amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        amountTextField.topAnchor.constraint(equalTo: insertAmountLabel.bottomAnchor, constant: 16).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        view.addSubview(minimumAmountInfoLabel)
        minimumAmountInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        minimumAmountInfoLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 8).isActive = true
        
        view.addSubview(amountWrapperCollectionView)
//        amountWrapperCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
//        amountWrapperCollectionView.topAnchor.constraint(equalTo: minimumAmountInfoLabel.bottomAnchor, constant: 8).isActive = true
//        amountWrapperCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
//        amountWrapperCollectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
