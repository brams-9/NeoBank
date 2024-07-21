//
//  ViewController.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 16/07/24.
//

import UIKit
import HMSegmentedControl


class ProductListViewController: UIViewController {

    // MARK: Properties Declaration
    
    var viewModel: ProductListViewModelProtocol?
    private var flexibleProductList: [ProductItemModel] = []
    private var fixedIncomeProductList: [ProductItemModel] = []
    private var selectedProductGroupType: ProductGroupType = .flexible
    
    lazy var segmentedControlView: HMSegmentedControl = {
        let segmentedControl = HMSegmentedControl(sectionTitles: ["Fleksibel", "Bunga Tetap"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(self.segmentValueChanged(_:)), for: .valueChanged)
        segmentedControl.selectionIndicatorLocation = .bottom
        segmentedControl.selectionIndicatorColor = .tintColor ?? .red

        return segmentedControl
    } ()
    
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
    
    init(viewModel: ProductListViewModelProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        loadData()
        bindViewModel()
    }
    
    func loadData() {
        if (flexibleProductList.isEmpty || fixedIncomeProductList.isEmpty) {
            Task {
                await viewModel?.getProductList(productGroupType:  selectedProductGroupType)
            }
            return
        }
        
        self.productListTableView?.reloadData()
    }
    
    func bindViewModel() {
        guard var viewModel = viewModel, viewModel is ProductListViewModel else { return }
        viewModel.onDataUpdate = { [self] productGroupType in
            
            DispatchQueue.main.async {
                switch productGroupType {
                case .flexible:
                    guard self.flexibleProductList.isEmpty else {return}
                    self.flexibleProductList.append(contentsOf: viewModel.flexibleProductList)
                    self.productListTableView?.reloadData()
                case .fixedIncome:
                    guard self.fixedIncomeProductList.isEmpty else {return}
                    self.fixedIncomeProductList.append(contentsOf: viewModel.fixedIncomeProductList)
                    self.productListTableView?.reloadData()
                }
            }
        }
        
        viewModel.onPaginationDataUpdate = { [self] productGroupType in
            
            DispatchQueue.main.async {
                switch productGroupType {
                case .flexible:
                    self.flexibleProductList.append(contentsOf: viewModel.flexibleProductList)
                    self.productListTableView?.reloadData()
                case .fixedIncome:
                    self.fixedIncomeProductList.append(contentsOf: viewModel.fixedIncomeProductList)
                    self.productListTableView?.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        productListTableView = nil
    }
    
    @objc func segmentValueChanged(_ sender: HMSegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            selectedProductGroupType = .flexible
            loadData()
            subHeaderLabel.text = "Fleksibel"
        }
        
        if (sender.selectedSegmentIndex == 1) {
            selectedProductGroupType = .fixedIncome
            loadData()
            subHeaderLabel.text = "Bunga Tetap"
        }

    }
    
}

// MARK: UITableViewDelegate & UITableViewDataSource implementation
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (selectedProductGroupType == .fixedIncome) {
            return self.fixedIncomeProductList.count
        }

        return self.flexibleProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewCell = tableView.dequeueReusableCell(withIdentifier: "ProductListItemCellID", for: indexPath) as? ProductListItemTableViewCell else { return UITableViewCell() }
        if (selectedProductGroupType == .flexible) {
            let productListItem = flexibleProductList[indexPath.row]
            viewCell.setData(productItemData: productListItem)
        } else {
            let productListItem = fixedIncomeProductList[indexPath.row]
            viewCell.setData(productItemData: productListItem)
        }

        viewCell.selectionStyle = .none
        
        return viewCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height

            if offsetY > contentHeight - height {
                Task {
                    guard var productListViewModel = viewModel as? ProductListViewModel else { return }
                    if(!productListViewModel.isFetching) {
                        await productListViewModel.loadMoreProductList(productGroupType: selectedProductGroupType)
                    }
                }
            }
        }

}


