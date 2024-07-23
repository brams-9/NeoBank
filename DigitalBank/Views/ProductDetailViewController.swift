//
//  ProductDetailViewController.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 21/07/24.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    
    lazy var headerLabel: UILabel = {
        let headerLabel: UILabel = UILabel()
        headerLabel.text = "Depositor Flexi 1 bulan"
        headerLabel.textColor = .titleColor
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    lazy var rateLabel: UILabel = {
        let subHeaderLabel: UILabel = UILabel()
        subHeaderLabel.text = "7,5 %"
        subHeaderLabel.font = UIFont.boldSystemFont(ofSize: 24)
        subHeaderLabel.textColor = .growthColor
        subHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return subHeaderLabel
    }()
    
    lazy var periodTermLabel: UILabel = {
        let periodTermLabel: UILabel = UILabel()
        periodTermLabel.text = "1 Bulan"
        periodTermLabel.textColor = .titleColor
        periodTermLabel.font = UIFont.systemFont(ofSize: 12)
        periodTermLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return periodTermLabel
    }()
    
    lazy var productRateInformationStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [rateLabel, periodTermLabel])
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.alignment = .bottom
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Suku bunga saat ini akan dihitung berdasarkan "suku bunga dasar + suku bunga tambahan" dan suku bunga saat roll-over akan dihitung berdasarkan suku bunga yang berlaku di tanggal roll-over.
        """
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .subtitleColor
        label.numberOfLines = 4

        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var dividerGap: DividerGap = {
        let dividerGap = DividerGap(in: self.view,height: 16, backgroundColor: .subtleColor ?? .lightGray)
        dividerGap.translatesAutoresizingMaskIntoConstraints = false
        
        return dividerGap
    }()
    
    lazy var insertAmountLabel: UILabel = {
        let headerLabel: UILabel = UILabel()
        headerLabel.text = "Masukkan jumlah deposito"
        headerLabel.textColor = .titleColor
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    lazy var amountTextField: CustomTextfield = {
        let textField = CustomTextfield()
        textField.font = UIFont.boldSystemFont(ofSize: 24)
        textField.text = "Rp. 000"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var minimumAmountInfoLabel: UILabel = {
        let headerLabel: UILabel = UILabel()
        headerLabel.text = "Minimum deposito Rp.100.000"
        headerLabel.textColor = .subtitleColor
        headerLabel.font = UIFont.boldSystemFont(ofSize: 12)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    lazy var amountWrapperCollectionView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return amountWrapperCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backButtonAppearance = UIBarButtonItem.appearance()
        backButtonAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        backButtonAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
        backButtonAppearance.tintColor = .titleColor
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
}
