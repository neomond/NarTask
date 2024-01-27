//
//  File.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 26.01.24.
//

import UIKit
class StoriesCollectionView: UICollectionView {
    
    // MARK: - Init
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    // Add another initializer
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        self.init(frame: .zero, collectionViewLayout: layout)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
