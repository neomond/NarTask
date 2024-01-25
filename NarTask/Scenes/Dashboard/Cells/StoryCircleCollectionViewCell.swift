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
    
    let container: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.layer.cornerRadius = 40
          view.layer.borderWidth = 2
          view.layer.borderColor = UIColor.systemPink.cgColor
          view.backgroundColor = .white
          view.clipsToBounds = true
          return view
      }()
    
    let imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFill
           imageView.layer.cornerRadius = 38
           imageView.clipsToBounds = true
           return imageView
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
            addSubview(container)
            container.snp.makeConstraints { make in
                make.width.height.equalTo(80)
                make.center.equalToSuperview()
            }
            container.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(72)
                make.center.equalToSuperview()
            }
    }
}

