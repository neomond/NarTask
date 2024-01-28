//
//  GridItemView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class GridItemView: UICollectionViewCell {
    private lazy var iconContainerView: UIView = {
        let imgContainer = UIView()
        imgContainer.translatesAutoresizingMaskIntoConstraints = false
        imgContainer.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        imgContainer.layer.cornerRadius = 20
        imgContainer.clipsToBounds = true
        return imgContainer
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        
        
        iconContainerView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.height.width.equalTo(40)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
           
            // This insets the imageView from the container view, providing the padding
        }
        //        iconImageView.snp.makeConstraints { make in
        //            make.centerY.equalToSuperview()
        //            make.left.equalToSuperview().inset(12)
        //            make.height.width.equalTo(40)
        //        }
        
//        titleLabel.snp.updateConstraints { make in
//            make.left.equalTo(iconContainerView.snp.right).offset(8)
//            make.right.equalToSuperview().inset(8)
//            make.centerY.equalToSuperview()
//            make.height.equalTo(iconImageView.snp.height)
//        }
        titleLabel.snp.makeConstraints { make in
                    make.left.equalTo(iconContainerView.snp.right).offset(8)
                    make.centerY.equalTo(iconContainerView.snp.centerY)
                    make.right.equalToSuperview().inset(8)
                }
    }
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .white
        //        contentView.layer.cornerRadius = 10
        //        contentView.layer.cornerRadius = 10
        
    }
    
    func configure(with serviceType: ServiceType) {
        titleLabel.text = serviceType.getTitle()
        iconImageView.image = serviceType.getImage()
    }
}
