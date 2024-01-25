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
    
    let titleLabel = UILabel()
    let imageView = UIImageView()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        contentView.backgroundColor = .clear
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .left
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(imageView)
        
        
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
        
    }                   
    
    func configure(with title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}
