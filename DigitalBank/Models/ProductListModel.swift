//
//  ProductListModel.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

enum ProductGroupType {
    case flexible
    case fixedIncome
}

struct ProductItemModel {
    let productName: String
    let markertingOptions: String?
    let rate: Float
    let startingAmount: Int
    let isPopular: Bool
}

struct ProductListModel {
    let data: [ProductItemModel]
    let productListType: ProductGroupType
}
