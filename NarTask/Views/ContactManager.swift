//
//  ContactManager.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 31.01.24.
//

import UIKit
import SnapKit

class ContactManagerView: UIView, UITextFieldDelegate {
    // MARK: - Subviews
    private let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    private let prefixLabel: UILabel = {
        let label = UILabel()
        label.text = "+994"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = ColorStyle.dataLabel.load()
        return label
    }()
    
    private let contactsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "contacts_book"), for: .normal)
        button.contentMode = .center
        return button
    }()
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.keyboardType = .phonePad
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.delegate = self
        return textField
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        addSubview(container)
        container.addSubview(prefixLabel)
        container.addSubview(titleLabel)
        container.addSubview(contactsButton)
        container.addSubview(inputTextField)
        
        setupConstraints()
        addActionHandlers()
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(56)
        }
        
        prefixLabel.snp.makeConstraints { make in
            make.left.equalTo(container.snp.left).offset(16)
            make.bottom.equalTo(container.snp.bottom).offset(-12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(container.snp.left).offset(16)
            make.top.equalTo(prefixLabel.snp.top).offset(-18)
        }
        
        contactsButton.snp.makeConstraints { make in
            make.right.equalTo(container.snp.right).offset(-16)
            make.centerY.equalTo(container)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        inputTextField.snp.makeConstraints { make in
            make.edges.equalTo(container).inset(UIEdgeInsets(top: 12, left: 60, bottom: 0, right: 56))
        }
    }
    
    // MARK: - Actions
    private func addActionHandlers() {
        contactsButton.addTarget(self, action: #selector(contactsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func contactsButtonTapped() {
        // logic to be continued
    }
    
    // MARK: - UITextFieldDelegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        titleLabel.isHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.isHidden = textField.text?.isEmpty ?? true
    }
    
    // MARK: - Configuration
    func configure(withTitle title: String, placeholder: String, contactImage: UIImage) {
        titleLabel.text = title
        inputTextField.placeholder = placeholder
        contactsButton.setImage(contactImage, for: .normal)
    }
}
