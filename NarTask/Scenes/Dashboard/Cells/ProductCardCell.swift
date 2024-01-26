//
//  ProductCardCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class ProductCardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProductCardCell"
    
    // MARK: - View Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.imageView)
        self.updateConstraints()
        
    }
    
    override func updateConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(8)
            make.height.width.equalTo(60)
            make.right.lessThanOrEqualToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        updateConstraints()
    }
    
    func configure(with title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
    
    // MARK: - Update View
    
    func setupUI() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
    }
}
