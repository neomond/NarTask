import UIKit
import SnapKit

class StoryView: UIView {
    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.trackTintColor = ColorStyle.graySecondary.load()
        progressBar.tintColor = ColorStyle.mainColor.load()
        return progressBar
    }()
    
    // MARK: - Properties
    var timer: Timer?
    var currentIndex: Int = 0
    var totalStories: Int = 10
    var onStoryClosed: (() -> Void)?
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGestureRecognizers()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func setupView() {
        addSubview(imageView)
        addSubview(progressBar)
    }
    
    private func setupGestureRecognizers() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipe.direction = .left
        addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipe.direction = .right
        addGestureRecognizer(rightSwipe)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(centerAreaTapped))
        addGestureRecognizer(tapGesture)
        
        let centerTap = UITapGestureRecognizer(target: self, action: #selector(centerAreaTapped))
        addGestureRecognizer(centerTap)
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.2
        addGestureRecognizer(longPressGesture)
    }
    
    
    // MARK: - Gesture Recognizers
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            pauseStory()
        case .ended, .cancelled:
            resumeStory()
        default:
            break
        }
    }
    
    // MARK: - Story Progress Management
     func startStory() {
         progressBar.progress = 0.0
         timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
     }
     
      func loadStory(atIndex index: Int) {
         startStory()
     }
     
      func pauseStory() {
         timer?.invalidate()
     }
     
      func resumeStory() {
         let remainingTime = (1.0 - progressBar.progress) * 3.0
         timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
         timer?.fireDate = Date().addingTimeInterval(TimeInterval(remainingTime))
     }
     
     func showNextStory() {
         if currentIndex < totalStories - 1 {
             currentIndex += 1
             loadStory(atIndex: currentIndex)
         } else {
             closeStoryView()
         }
     }
     
      func showPreviousStory() {
         if currentIndex > 0 {
             currentIndex -= 1
             loadStory(atIndex: currentIndex)
         }
     }
    
    func closeStoryView() {
        timer?.invalidate()
        removeFromSuperview()
        onStoryClosed?()
    }
   
    
    // MARK: - User Interaction Handlers
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        timer?.invalidate()
        if gesture.direction == .left {
            showNextStory()
        } else if gesture.direction == .right {
            showPreviousStory()
        }
    }
    
    @objc func centerAreaTapped() {
        closeStoryView()
    }
    
    @objc func updateProgressBar() {
        progressBar.progress += 0.05 / 3.0
        if progressBar.progress >= 1.0 {
            closeStoryView()
        }
    }
    
  
    
    // MARK: - Layout Constraints
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(66)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(2)
        }
    }
    
    // MARK: - Configuration
    func configure(with image: UIImage, completion: @escaping () -> Void) {
        imageView.image = image
        self.onStoryClosed = completion
    }
}


