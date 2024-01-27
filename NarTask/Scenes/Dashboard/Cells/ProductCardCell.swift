//
//  ProductCardCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class ProductCardCell: UICollectionViewCell {
    let productType: ProductType
    static let reuseIdentifier = "ProductCardCell"
    
    // MARK: - View Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(productType: ProductType) {
        self.productType = productType
        super.init(frame: .zero)
        setupViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    private func setupViews() {
        self.titleLabel.text = productType.getTitle()
        self.imageView.image = productType.getImage()
        contentView.addSubview(self.titleLabel)
        contentView.addSubview(self.imageView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        titleLabel.snp.updateConstraints { make in
            make.top.equalTo(12)
            make.right.equalTo(imageView.snp.left).offset(-8)
            make.left.equalToSuperview().inset(8)
        }
        
        imageView.snp.updateConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(8)
            make.height.width.equalTo(80)
        }
    }
    
    
    // MARK: - Update View
    func setupUI() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}
