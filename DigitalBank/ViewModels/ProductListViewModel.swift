//
//  ProductListViewModel.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 17/07/24.
//

import Foundation

protocol ProductListViewModelProtocol {
    var onDataUpdate: ((ProductGroupType) -> Void)? { get set }
    var onPaginationDataUpdate: ((ProductGroupType) -> Void)? { get set }

    var flexibleProductList: [ProductItemModel] { get }
    var fixedIncomeProductList: [ProductItemModel] { get }

    func getProductList(productGroupType: ProductGroupType) async
    func loadMoreProductList(productGroupType: ProductGroupType) async
}

class ProductListViewModel: ProductListViewModelProtocol {

    init(productListRepository: ProductListRepositoryProtocol) {
        self.productListRepository = productListRepository
    }
    
    private var productListRepository: ProductListRepositoryProtocol
    var onDataUpdate: ((ProductGroupType) -> Void)?
    var onPaginationDataUpdate: ((ProductGroupType) -> Void)?

    var isFetching: Bool = true

    var flexibleProductList: [ProductItemModel] = []
    
    var fixedIncomeProductList: [ProductItemModel] = []
    
    func getProductList(productGroupType: ProductGroupType) async {
        let data: [ProductListModel]? = await productListRepository.fetchProductListData()
        isFetching = false
        switch productGroupType {
        case .flexible:
            flexibleProductList = data?.first(where: { item in
                item.productListType == .flexible
            })?.data ?? []
            onDataUpdate?(.flexible)
        case .fixedIncome:
            fixedIncomeProductList = data?.first(where: { item in
                item.productListType == .fixedIncome
            })?.data ?? []
            onDataUpdate?(.fixedIncome)
        }
    }
    
    func loadMoreProductList(productGroupType: ProductGroupType) async {
        isFetching = true
        let data: [ProductListModel]? = await productListRepository.fetchProductListData()
        isFetching = false
        switch productGroupType {
        case .flexible:
            flexibleProductList.append(contentsOf: data?.first(where: { item in
                item.productListType == .flexible
            })?.data ?? [])
            onPaginationDataUpdate?(.flexible)
            
        case .fixedIncome:
            fixedIncomeProductList.append(contentsOf: data?.first(where: { item in
                item.productListType == .fixedIncome
            })?.data ?? [])
            onPaginationDataUpdate?(.fixedIncome)
        }
    }
    
}


