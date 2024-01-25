//
//  ProductCardContainerView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class ProductCardContainerView: UIView {
    
    let productCard1 = ProductCardCell(frame: .zero)
    let productCard2 = ProductCardCell(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProductCards()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProductCards() {
        addSubview(productCard1)
        addSubview(productCard2)
        
        productCard1.configure(with: "Tariflər", image: UIImage(named: "tarifler") ?? UIImage())
        productCard2.configure(with: "Paketlər", image: UIImage(named: "paketler") ?? UIImage())
        
        productCard1.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(self.snp.centerX).offset(-8)
        }
        
        productCard2.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.snp.centerX).offset(8)
        }
    }
}
