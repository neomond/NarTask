//
//  ServicesGridView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

enum ServiceType: String, CaseIterable {
    case topUp = "Top up"
    case credit = "Kredit"
    case requestForHelp = "Request for help"
    case eSimOrder = "E-sim order"
    case freeSMS = "Free SMS"
    case favouriteNumber = "Favourite number"
    case balanceTransfer = "Balance transfer"
    case cevirOffer = "'Çevir' offer"
    case servicesAbroad = "Əlava dayar xidmətləri"
    case roaming = "Roaming"

    func getTitle() -> String {
        return self.rawValue
    }

    func getImage() -> UIImage? {
        switch self {
        case .topUp:
            AppAssets.tarifler.load()
        case .credit:
            AppAssets.tarifler.load()
        case .requestForHelp:
            AppAssets.tarifler.load()
        case .eSimOrder:
            AppAssets.tarifler.load()
        case .freeSMS:
            AppAssets.tarifler.load()
        case .favouriteNumber:
            AppAssets.tarifler.load()
        case .balanceTransfer:
            AppAssets.tarifler.load()
        case .cevirOffer:
            AppAssets.tarifler.load()
        case .servicesAbroad:
            AppAssets.tarifler.load()
        case .roaming:
            AppAssets.tarifler.load()
        }
    }
}


class ServicesGridView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Xidmətlər"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    } ()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
                setupViews()
                setupConstraints()
                setupGridItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
        setupGridItems()
    }
    
    private func setupViews() {
            addSubview(titleLabel)
            addSubview(contentStackView)
        }
    
    private func setupConstraints() {
           titleLabel.snp.makeConstraints { make in
               make.top.leading.trailing.equalToSuperview().inset(16)
           }
           
           contentStackView.snp.makeConstraints { make in
               make.top.equalTo(titleLabel.snp.bottom).offset(16)
               make.left.right.bottom.equalToSuperview().inset(16)
           }
       }
    
    func addRow(with views: [UIView]) {
           let rowStackView = UIStackView()
           rowStackView.axis = .horizontal
           rowStackView.distribution = .fillEqually
           rowStackView.alignment = .fill
           rowStackView.spacing = 10
           
           views.forEach { rowStackView.addArrangedSubview($0) }
           contentStackView.addArrangedSubview(rowStackView)
       }
    
    func setupGridItems() {
            // Assuming a 2-column grid for this example
            let columnCount = 2
            let serviceTypes = ServiceType.allCases
            var gridItemViews: [GridItemView] = []
            
            for serviceType in serviceTypes {
                let gridItemView = GridItemView()
                gridItemView.configure(with: serviceType)
                gridItemViews.append(gridItemView)
            }
            
            for i in 0..<gridItemViews.count / columnCount {
                let rowViews = gridItemViews[i*columnCount..<(i+1)*columnCount]
                addRow(with: Array(rowViews))
            }
            
            // Handle the last row if the number of services is odd
            if serviceTypes.count % columnCount != 0 {
                let lastRowStartIndex = (serviceTypes.count / columnCount) * columnCount
                let rowViews = gridItemViews[lastRowStartIndex..<serviceTypes.count]
                addRow(with: Array(rowViews))
            }
        }
    
}
