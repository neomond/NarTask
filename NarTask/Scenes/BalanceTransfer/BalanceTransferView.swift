//
//  BalanceTransferView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit


final class BalanceTransferView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        return view
    }()
    
    
    private func setupUI() {
        self.backgroundColor = ColorStyle.bgColor.load()
        
      }
    
    // MARK: - Init
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
