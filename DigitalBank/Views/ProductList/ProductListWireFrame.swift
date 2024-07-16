//
//  ProductListWireFrame.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 16/07/24.
//

import Foundation
import UIKit

class ProductListWireFrame {
    private var productListViewController: UIViewController
    
    init() {
        productListViewController = ProductListViewController()
    }
    
    func getViewController() -> UIViewController {
        guard let vc = productListViewController as? ProductListViewController else {return ProductListViewController()}

        return vc
    }
}
