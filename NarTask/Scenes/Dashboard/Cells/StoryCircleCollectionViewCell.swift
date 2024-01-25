//
//  StoryCircleCollectionViewCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 24.01.24.
//

import UIKit
import SnapKit

class StoryCircleCell: UICollectionViewCell {
    static var reuseIdentifier: String = "StoryCircleCell"
    let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 40
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(circleView)
        circleView.snp.makeConstraints { make in
           
            make.width.height.equalTo(80)
        }
       
    }
}
