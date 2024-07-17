//
//  ViewController.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 16/07/24.
//

import UIKit


class ProductListViewController: UIViewController {

    // MARK: Properties Declaration
    lazy var productListContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.subtitleColor?.cgColor
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var productListTableView : UITableView? = {
        let productListTableView: UITableView = UITableView()
        productListTableView.register(ProductListItemTableViewCell.self, forCellReuseIdentifier: "ProductListItemCellID")
        productListTableView.dataSource = self
        productListTableView.delegate = self
        productListTableView.separatorStyle = .singleLine
        productListTableView.showsVerticalScrollIndicator = false

        productListTableView.translatesAutoresizingMaskIntoConstraints = false

        return productListTableView
    }()
    
    lazy var headerLabel: UILabel = {
        let headerLabel: UILabel = UILabel()
        headerLabel.text = "Wealth"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    lazy var subHeaderLabel: UILabel = {
        let subHeaderLabel: UILabel = UILabel()
        subHeaderLabel.text = "Fleksibel"
        subHeaderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        subHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return subHeaderLabel
    }()

    // MARK: Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("teststs")

        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        productListTableView = nil
    }
    
    
}

// MARK: UITableViewDelegate & UITableViewDataSource implementation
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewCell = tableView.dequeueReusableCell(withIdentifier: "ProductListItemCellID", for: indexPath) as? ProductListItemTableViewCell else { return UITableViewCell() }
        viewCell.selectionStyle = .none
        
        return viewCell
    }

}


