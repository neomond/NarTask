//
//  PhoneNumTextFieldView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 30.01.24.
//


import UIKit
import SnapKit

class PhoneNumTextFieldView: UITextField, UITextFieldDelegate {
    // MARK: - Subviews
   private let prefixLabel: UILabel = {
        let label = UILabel()
        label.text = "+994"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Kimə"
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
        borderStyle = .none
        backgroundColor = .white
        keyboardType = .phonePad
        
        addSubview(prefixLabel)
        addSubview(titleLabel)
        rightView = contactsButton
        rightViewMode = .always
        
        layer.cornerRadius = 16
        self.font = UIFont.systemFont(ofSize: 14)
        
        setupConstraints()
        addActionHandlers()
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
        }
        prefixLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-12)
        }
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        contactsButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
    }
    
    // MARK: - Actions
    private func addActionHandlers() {
        contactsButton.addTarget(self, action: #selector(contactsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func contactsButtonTapped() {
        // logic to be continued
    }
    
    // MARK: - Override Methods
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let padding: CGFloat = 10
        let size: CGFloat = 40
        let yPosition = (bounds.height - size) / 2
        return CGRect(x: bounds.width - size - padding, y: yPosition, width: size, height: size)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let topInset: CGFloat = 12
        return bounds.inset(by: UIEdgeInsets(top: topInset, left: 60, bottom: 0, right: 50))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let topInset: CGFloat = 12
        return bounds.inset(by: UIEdgeInsets(top: topInset, left: 60, bottom: 0, right: 50))

    }
    
    // MARK: - UITextFieldDelegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = " "
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            textField.text = ""
        }
    }
    
    // MARK: - Public Methods
    func configure(withPlaceholder placeholder: String, image: UIImage) {
        self.placeholder = placeholder
        contactsButton.setImage(image, for: .normal)
    }
}

