//
//  ProductListViewLayoutSetup.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 17/07/24.
//

import UIKit

extension ProductListViewController {
    func setupLayout() {

        
        self.view.addSubview(headerLabel)
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        self.view.addSubview(segmentedControlView)
        segmentedControlView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: 24).isActive = true
        segmentedControlView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        segmentedControlView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24).isActive = true
        segmentedControlView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        self.view.addSubview(subHeaderLabel)
        subHeaderLabel.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor,constant: 24).isActive = true
        subHeaderLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor).isActive = true
        
        if let productListTableView = productListTableView {
            self.view.addSubview(productListContainerView)
            productListContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
            productListContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
            productListContainerView.topAnchor.constraint(equalTo: subHeaderLabel.bottomAnchor, constant: 16).isActive = true
            productListContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
            productListContainerView.addSubview(productListTableView)
            productListTableView.topAnchor.constraint(equalTo: productListContainerView.topAnchor,constant: 8).isActive = true
            productListTableView.leadingAnchor.constraint(equalTo: productListContainerView.leadingAnchor,constant: 12).isActive = true
            productListTableView.trailingAnchor.constraint(equalTo: productListContainerView.trailingAnchor,constant: -12).isActive = true
            productListTableView.bottomAnchor.constraint(equalTo: productListContainerView.bottomAnchor).isActive = true
        }
    }
}
