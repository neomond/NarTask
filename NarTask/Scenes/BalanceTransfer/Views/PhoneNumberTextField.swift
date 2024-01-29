//
//  PhoneNumberTextField.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import SnapKit

class PhoneNumberTextField: UITextField {
    
    // MARK: - Subviews
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
        // Customize the text field appearance
        borderStyle = .none
        backgroundColor = .white
        keyboardType = .phonePad
        placeholder = "Mobil nömrə"
        
        // Add the button as a rightView
        rightView = contactsButton
        rightViewMode = .always
        
        // Set the corner radius and other styles to match your design
        layer.cornerRadius = 10
        
        
        setupConstraints()
        addActionHandlers()
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(56) // Example height, adjust as needed
        }
        
        contactsButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 40, height: 40)) // Adjust size as needed
        }
    }
    
    // MARK: - Actions
    private func addActionHandlers() {
        contactsButton.addTarget(self, action: #selector(contactsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func contactsButtonTapped() {
    
    }
    
    // MARK: - Override Methods
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
     
        let padding: CGFloat = 10
        let size: CGFloat = 40
        let yPosition = (bounds.height - size) / 2
        return CGRect(x: bounds.width - size - padding, y: yPosition, width: size, height: size)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40))
    }
    
    // MARK: - Public Methods
    func configure(withPlaceholder placeholder: String, image: UIImage) {
        self.placeholder = placeholder
        contactsButton.setImage(image, for: .normal)
    }
}

