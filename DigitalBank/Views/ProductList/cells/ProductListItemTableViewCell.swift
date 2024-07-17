//
//  ProductListItemTableViewCell.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 17/07/24.
//

import UIKit

class ProductListItemTableViewCell: UITableViewCell {    

    // MARK: Properties Declaration
    lazy var productNameLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.text = "Flexi 1"
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        productNameLabel.textColor = UIColor.titleColor

        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return productNameLabel
    }()
    
    
    lazy var popularBadgeView: ChipView = {
        let view = ChipView(text: "Populer", chipTypeValue: .PopularChip)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var productInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel, popularBadgeView])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    lazy var marketingPointsLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.text = "Bunga Tinggi; Ekstra bunga 1.5%"
        productNameLabel.font = UIFont.systemFont(ofSize: 12)
        productNameLabel.textColor = UIColor.titleColor

        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return productNameLabel
    }()
    
    lazy var rateLabel: UILabel = {
        let rateLabel = UILabel()
        let attributedText = NSMutableAttributedString()

        let largeFont = UIFont.boldSystemFont(ofSize: 16)
        let rateValueText = NSAttributedString(string: "1,5% ", attributes: [NSAttributedString.Key.font: largeFont])
        attributedText.append(rateValueText)
        
        let smallFont = UIFont.boldSystemFont(ofSize: 12)
        let perAnnumText = NSAttributedString(string: "p.a", attributes: [NSAttributedString.Key.font: smallFont])
        attributedText.append(perAnnumText)

        rateLabel.attributedText = attributedText
        rateLabel.textColor = UIColor.growthColor

        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return rateLabel
    }()
    
    lazy var interestLabel: UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.text = "Bunga"
        productNameLabel.font = UIFont.systemFont(ofSize: 12)
        productNameLabel.textColor = UIColor.subtitleColor

        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return productNameLabel
    }()
    
    lazy var rateInterestStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateLabel,interestLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var startingAmountLabel: UILabel = {
        let startingAmountLabel = UILabel()
        startingAmountLabel.text = "100 rb"
        startingAmountLabel.font = UIFont.boldSystemFont(ofSize: 16)
        startingAmountLabel.textColor = UIColor.titleColor

        startingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return startingAmountLabel
    }()
    
    lazy var startAmountInfoLabel: UILabel = {
        let startAmountInfoLabel = UILabel()
        startAmountInfoLabel.text = "Mulai dari"
        startAmountInfoLabel.font = UIFont.systemFont(ofSize: 12)
        startAmountInfoLabel.textColor = UIColor.subtitleColor

        startAmountInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return startAmountInfoLabel
    }()
    
    lazy var startingAmountStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startingAmountLabel,startAmountInfoLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 4
        
        return stackView
    }()
    
    
    
    lazy var indicatorView: ChipView = {
        let indicatorView = ChipView(text: "Buka", chipTypeValue: .TintedChip)
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        return indicatorView
    }()
    
    lazy var productRateInformationStackViews: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateInterestStackView,startingAmountStackView,indicatorView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: Initialization


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(productInfoStackView)
        productInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productInfoStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 12).isActive = true
        
        self.addSubview(marketingPointsLabel)
        marketingPointsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        marketingPointsLabel.topAnchor.constraint(equalTo: self.productInfoStackView.bottomAnchor, constant: 4).isActive = true
        
        self.addSubview(productRateInformationStackViews)
        productRateInformationStackViews.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productRateInformationStackViews.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        productRateInformationStackViews.topAnchor.constraint(equalTo: self.marketingPointsLabel.bottomAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
