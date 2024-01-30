
import UIKit

class DashboardView: UIView {
    private lazy var externalView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.bgColor.load()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Product Card Container View
    lazy var productCardContainerView: ProductCardContainerView = {
        let view = ProductCardContainerView()
        return view
    }()
    
    
    // MARK: - Services Grid View
    lazy var servicesGridView: ServicesGridView = {
        let view =  ServicesGridView()
        return view
    }()
    
    // MARK: - Stories Collection View
    lazy var storiesCollectionView: StoriesCollectionView = {
        let collectionView = StoriesCollectionView()
        collectionView.backgroundColor = .clear
        collectionView.register(StoryCircleCell.self, forCellWithReuseIdentifier: StoryCircleCell.reuseIdentifier)
        return collectionView
    }()
    
   private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private func setupSubviews() {
        stackView.addArrangedSubview(storiesCollectionView)
        stackView.addArrangedSubview(productCardContainerView)
        stackView.addArrangedSubview(servicesGridView)
        self.containerView.addSubview(stackView)
        scrollView.addSubview(containerView)
        externalView.addSubview(scrollView)
        self.addSubview(externalView)
    }
  
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
        storiesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(80 + 24)
        }
        productCardContainerView.snp.makeConstraints { make in
            make.height.equalTo(100 + 24)
        }
        
        
    }
}





