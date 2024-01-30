//
//  VASView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 28.01.24.
//

import UIKit

final class VASView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var callForwardView = CallForwardingView()
    private lazy var missedCallView = MissedCallView()
    
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
    private func setupUI() {
        self.backgroundColor = ColorStyle.serviceBgColor.load()
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(callForwardView)
        contentView.addSubview(missedCallView)
        
    }

    private func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(.low)
            // ::here -> contentView will be smaller than the scrollView
        }
        callForwardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        missedCallView.snp.makeConstraints { make in
            make.top.equalTo(callForwardView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
    }
    
    
}
