
import UIKit

class DashboardView: UIView {
    private let externalView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.bgColor.load()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Məhsullar"
        return label
    }()
    
    lazy var productCardContainerView: ProductCardContainerView = {
        let view = ProductCardContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var servicesGridView: ServicesGridView = {
        let view = ServicesGridView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    
    private func setupSubviews() {
        stackView.addArrangedSubview(collectionView)
        self.containerView.addSubview(stackView)
        scrollView.addSubview(containerView)
        externalView.addSubview(scrollView)
        self.addSubview(externalView)
        
        
        //           setupProductCardContainerView()
        //           setupServicesGridView()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
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
        self.backgroundColor = ColorStyle.mainColor.load()
        setupSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        externalView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(UIScreen.main.bounds.height * 0.2)
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(96)
        }
    }
}



//    private func setupProductCardContainerView() {
//        containerView.addSubview(titleLabel)
//        containerView.addSubview(productCardContainerView)
//
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(collectionView.snp.bottom).offset(16)
//            make.left.right.equalToSuperview().inset(16)
//        }
//
//        productCardContainerView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(16)
//            make.left.right.equalToSuperview().inset(16)
//            make.height.equalTo(80)
//        }
//    }
//

//   ` private func setupServicesGridView() {
//        containerView.addSubview(servicesGridView)
//
//        servicesGridView.snp.makeConstraints { make in
//            make.top.equalTo(productCardContainerView.snp.bottom).offset(16)
//            make.left.right.equalToSuperview().inset(16)
//            make.bottom.equalToSuperview().inset(16)
//        }`


