//
//  ProductListDataModel.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

struct ProductListResponse: Codable {
    let rate: Float
    let code: String
    let marketingPoints: [String]
    let productName: String
    let startingAmount: Int
    let isPopular: Bool
}

struct ProductGroupListResponse: Codable {
    let productList: [ProductListResponse]
    let productGroupName: String
}
