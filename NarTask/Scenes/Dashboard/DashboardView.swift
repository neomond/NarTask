//
//  DashboardView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit
import SnapKit
//import AzercellUIkit

protocol DashboardViewDelegate: AnyObject {
    func addCard(number: String)
}

final class DashboardView: UIView, ThemeableView {
    
    // MARK: - Variables
    
//    var theme: ThemeProvider = App.theme
    weak var delegate: DashboardViewDelegate?
    
    // MARK: - View Components
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var customerName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
//        label.textColor = adaptiveColor(.main)
//        label.font = UIFont(name: "HelveticaNeue-bold", size: 32)
        label.text = "Nazrin"
        return label
    }()
    
    lazy var customerNumber: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
//        label.textColor = adaptiveColor(.main)
//        label.font = UIFont(name: "HelveticaNeue-bold", size: 20)
        label.text = "00000"
        return label
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.layer.borderColor = adaptiveColor(.main).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var cardTextField: UITextField = {
        let textField = UITextField()
//        textField.textColor = adaptiveColor(.secondColor)
        textField.placeholder = "Add 16 digit number..."
        return textField
    }()
    
    private lazy var cardAddButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add card", for: .normal)
        button.addTarget(self, action: #selector(returnNumber), for: .touchUpInside)
//        button.backgroundColor = adaptiveColor(.main)
        return button
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.clipsToBounds = false
        collectionView.allowsMultipleSelection = false
//        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIdentifier)
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        self.scrollView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
        }
        
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        self.cardView.snp.updateConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(200)
        }

        self.cardTextField.snp.updateConstraints { make in
            make.center.equalTo(self.cardView.snp.center)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(54)
        }
        
        self.cardAddButton.snp.updateConstraints { make in
            make.top.equalTo(self.cardTextField.snp.bottom).offset(8)
            make.height.equalTo(54)
            make.centerX.equalTo(self.cardView.snp.centerX)
            make.width.equalTo(120)
        }
        
        self.collectionView.snp.updateConstraints { make in
            make.height.equalTo(200)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        super.updateConstraints()
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        
        self.contentStackView.addArrangedSubview(self.customerName)
        self.contentStackView.addArrangedSubview(self.customerNumber)
        self.contentStackView.addArrangedSubview(self.cardView)
        self.contentStackView.addArrangedSubview(self.collectionView)
        
        self.cardView.addSubview(self.cardTextField)
        self.cardView.addSubview(self.cardAddButton)
        
        self.updateConstraints()
    }
    
    @objc func returnNumber() {
        if let delegate = self.delegate {
            delegate.addCard(number: self.cardTextField.text ?? "")
        }
    }
    
    private func setupUI() {
//        self.backgroundColor =adaptiveColor(.black)
        self.backgroundColor = .black
    }
}
