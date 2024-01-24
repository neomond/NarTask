
import UIKit
class DashboardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorStyle.bgColor.load()
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 16
    
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
