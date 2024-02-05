//
//  TransferredAmount.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

class TransferredAmountView: UIView {
    
    private var amountButtons: [UIButton] = []
    
    // Colors for the active and inactive states
    private let activeBackgroundColor = ColorStyle.btnActive.load()!
    private let inactiveBackgroundColor: UIColor = .white
    private let activeBorderColor = ColorStyle.mainColor.load()!
    private let inactiveBorderColor = ColorStyle.graySecondary.load()!
    private let activeTitleColor = ColorStyle.mainColor.load()!
    private let inactiveTitleColor: UIColor = .black
    
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Köçürüləcək məbləğ"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var amountsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Amount btns
    private func createAmountButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = inactiveBackgroundColor
        button.setTitleColor(inactiveTitleColor, for: .normal)
        button.layer.cornerRadius = 26
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(amountButtonTapped(_:)), for: .touchUpInside)

        return button
    }
    
    private func setButtonSelectionState(button: UIButton, selected: Bool) {
        button.backgroundColor = selected ? activeBackgroundColor : inactiveBackgroundColor
        button.setTitleColor(selected ? activeTitleColor : inactiveTitleColor, for: .normal)
        button.layer.borderColor = selected ? activeBorderColor.cgColor : inactiveBorderColor.cgColor
    }
    
    @objc private func amountButtonTapped(_ sender: UIButton) {
        amountButtons.forEach { button in
            setButtonSelectionState(button: button, selected: false)
        }
        setButtonSelectionState(button: sender, selected: true)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(amountsStackView)

        let amountBtn1: UIButton = createAmountButton(title: "0.20 ₼")
        let amountBtn2: UIButton = createAmountButton(title: "0.50 ₼")
        let amountBtn3: UIButton = createAmountButton(title: "1.00 ₼")
        let amountBtn4: UIButton = createAmountButton(title: "2.00 ₼")
        
        amountButtons = [amountBtn1, amountBtn2, amountBtn3, amountBtn4]
        amountButtons.forEach { button in
            amountsStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(amountButtonTapped(_:)), for: .touchUpInside)
        }
        
        // Set the first button as selected
        setButtonSelectionState(button: amountBtn1, selected: true)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        amountsStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        amountsStackView.arrangedSubviews.forEach { btn in
            btn.snp.makeConstraints { make in
                make.height.equalTo(56)
                make.width.equalTo(btn.snp.height)
            }
        }
    }
    
}
