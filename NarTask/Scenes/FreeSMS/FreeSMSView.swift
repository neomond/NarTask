//
//  FreeSMSView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

protocol FreeSMSViewDelegate: AnyObject {
    
}

final class FreeSMSView: UIView {
    
    weak var delegate: FreeSMSViewDelegate?
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = ColorStyle.bgColor.load()
    }
    
    
    private func addConstraints() {
//        scrollView.snp.updateConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        contentView.snp.updateConstraints { make in
//            make.edges.equalToSuperview()
//            make.width.equalToSuperview()
//        }
    }
    
}
