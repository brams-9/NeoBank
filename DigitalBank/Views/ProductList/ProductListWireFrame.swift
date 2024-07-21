//
//  ProductListWireFrame.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 16/07/24.
//

import Foundation
import UIKit

class ProductListWireFrame {
    private var productListRestAPIService: ProductListRestAPIServiceProtocol
    private var productListRepository: ProductListRepositoryProtocol
    private var productListViewModel: ProductListViewModelProtocol
    private var productListViewController: UIViewController
    
    init() {
        productListRestAPIService = ProductListRestAPIService(urlSession: URLSession.shared)
        productListRepository = ProductListRepository(productListRestAPIService: productListRestAPIService)
        productListViewModel = ProductListViewModel(productListRepository: productListRepository)
        productListViewController = ProductListViewController(viewModel: productListViewModel)
    }
    
    func getViewController() -> UIViewController {
        guard let vc = productListViewController as? ProductListViewController else {return ProductListViewController()}

        return vc
    }
}
