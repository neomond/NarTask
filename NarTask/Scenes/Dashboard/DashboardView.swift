
import UIKit
class DashboardView: UIView {
    let titleLabel = UILabel()
    let productCardContainerView = ProductCardContainerView()
    
    let collectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCircleCell.self, forCellWithReuseIdentifier: StoryCircleCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorStyle.bgColor.load()
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 16
        setupCollectionView()
        setupProductCardContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.right.equalToSuperview()
            make.height.equalTo(96)
        }
    }
    
    private func setupProductCardContainerView() {
        addSubview(titleLabel)
        addSubview(productCardContainerView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16) 
            make.left.right.equalToSuperview().inset(16)
        }
        
        titleLabel.text = "Məhsullar"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        productCardContainerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }}
}
