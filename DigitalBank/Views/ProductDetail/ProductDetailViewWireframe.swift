//
//  ProductDetailViewWireframe.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 21/07/24.
//

import UIKit

class ProductDetailViewWireFrame {
//    private var productListRestAPIService: ProductListRestAPIServiceProtocol
//    private var productListRepository: ProductListRepositoryProtocol
//    private var productListViewModel: ProductListViewModelProtocol
    private var productDetailViewController: UIViewController
    
    init() {
//        productListRestAPIService = ProductListRestAPIService(urlSession: URLSession.shared)
//        productListRepository = ProductListRepository(productListRestAPIService: productListRestAPIService)
//        productListViewModel = ProductListViewModel(productListRepository: productListRepository)
        productDetailViewController = ProductListViewController()
    }
    
    func getViewController() -> UIViewController {
        guard let vc = productDetailViewController as? ProductDetailViewController else {return ProductDetailViewController()}

        return vc
    }
}
