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
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Xidmətdən gün ərzində 10 dəfə istifadə etmək olar. Hər bir sorğunun dəyəri 0.10 AZN təşkil edir."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private var transferButtonView = TransferButtonView()
    private var transferredAmount = TransferredAmountView()
    
    private func setupUI() {
        self.backgroundColor = ColorStyle.serviceBgColor.load()
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(transferButtonView)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(.low) // Allows contentView to be smaller than scrollView
        }
        infoLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(transferButtonView.snp.top).offset(-16)
        }
        transferButtonView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.height.equalTo(56)
        }
    }
    
    // This will layout your subviews correctly
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
