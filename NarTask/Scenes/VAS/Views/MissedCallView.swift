//
//  MissedCallView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 31.01.24.
//

import UIKit
import SnapKit

class MissedCallView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Buraxılmış zəng"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Sizə zəng etməyə çalışanları şəbəkəyə qayıtmağınız barədə məlumatlandırın."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subscriptionInfoLabel: UILabel = {
        let label = UILabel()
        let fullText = "30 günlük / 0,10 ₼"
        let attributedString = NSMutableAttributedString(string: fullText)

        if let range = fullText.range(of: "/ 0,10 ₼") {
               attributedString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(range, in: fullText))
           }
        
        label.attributedText = attributedString
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var serviceSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = ColorStyle.mainColor.load()
        return switchControl
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(subscriptionInfoLabel)
        addSubview(serviceSwitch)
        addSubview(infoLabel)
        backgroundColor = .white
        layer.cornerRadius = 16
        
        // ::here -> for line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        let attributedString = NSMutableAttributedString(
            string: "Sizə zəng etməyə çalışanları şəbəkə qayıtmağınız barədə məlumatlandırın.",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.gray,
                .paragraphStyle: paragraphStyle
            ]
        )
        infoLabel.attributedText = attributedString
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        subscriptionInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        serviceSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(subscriptionInfoLabel.snp.centerY)
            make.right.equalToSuperview().offset(-16)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
         
        }
    }
    
}
