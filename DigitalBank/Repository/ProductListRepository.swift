//
//  ProductListRepository.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

protocol ProductListRepositoryProtocol {
    func fetchProductListData() async -> [ProductListModel]?
}

class ProductListRepository: ProductListRepositoryProtocol {
    
    init(productListRestAPIService: ProductListRestAPIServiceProtocol) {
        self.productListRestAPIService = productListRestAPIService
    }

    private var productListRestAPIService: ProductListRestAPIServiceProtocol

    
    func fetchProductListData() async -> [ProductListModel]? {
        let result = await productListRestAPIService.fetchProductListData()
        switch result {
        case .success(let productListData):
            return productListData.map { data in
                ProductListModel(
                    data: data.productList.map({ productListResponse in
                        ProductItemModel(productName: productListResponse.productName, markertingOptions: productListResponse.marketingPoints.joined(separator: "; "), rate: productListResponse.rate, startingAmount: productListResponse.startingAmount, isPopular: productListResponse.isPopular)
                        })
                    , productListType: data.productGroupName == "Flexible" ? .flexible : .fixedIncome
                )
            }
        case .failure(_):
            return nil
        }
    }
}
