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
            AppAssets.top_up.load()
        case .credit:
            AppAssets.credit.load()
        case .requestForHelp:
            AppAssets.user_request.load()
        case .eSimOrder:
            AppAssets.simcard.load()
        case .freeSMS:
            AppAssets.sms.load()
        case .favouriteNumber:
            AppAssets.favorite.load()
        case .balanceTransfer:
            AppAssets.balance_transfer.load()
        case .cevirOffer:
            AppAssets.exchange.load()
        case .servicesAbroad:
            AppAssets.vas.load()
        case .roaming:
            AppAssets.roaming.load()
        }
    }
}


class ServicesGridView: UIView, UIGestureRecognizerDelegate {
    weak var delegate: ServicesGridViewDelegate?
    
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
            make.left.right.bottom.equalToSuperview().inset(12)
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
          return true
      }
    
    func addRow(with views: [UIView]) {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fillEqually
        rowStackView.alignment = .fill
        rowStackView.spacing = 10
        
        views.forEach { view in
            view.snp.makeConstraints { make in
                make.height.equalTo(66)
            }
            rowStackView.addArrangedSubview(view)
        }
        contentStackView.addArrangedSubview(rowStackView)
    }
    
    func setupGridItems() {
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
        
        if serviceTypes.count % columnCount != 0 {
            let lastRowStartIndex = (serviceTypes.count / columnCount) * columnCount
            let rowViews = gridItemViews[lastRowStartIndex..<serviceTypes.count]
            addRow(with: Array(rowViews))
        }
        
        for gridItemView in gridItemViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gridItemTapped(_:)))
            tapGesture.delegate = self
            gridItemView.isUserInteractionEnabled = true
            gridItemView.addGestureRecognizer(tapGesture)
            
        }
    }
    
    @objc private func gridItemTapped(_  sender: UITapGestureRecognizer) {
        guard let gridItemView = sender.view as? GridItemView else {
            return
        }
        print("Grid item tapped")
        
        if delegate == nil {
            print("Delegate is nil")
        }

        if let serviceType = gridItemView.serviceType {
            delegate?.didSelectService(serviceType)
        }
    }

    
}

protocol ServicesGridViewDelegate: AnyObject {
    func didSelectService(_ service: ServiceType)
}
