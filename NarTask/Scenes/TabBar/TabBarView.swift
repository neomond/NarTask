//
//  TabBarView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

// TabBarView.swift

import UIKit

protocol TabBarViewDelegate: AnyObject {
    func middleButtonTapped()
}

final class TabBarView: UIView {
    
    weak var delegate: TabBarViewDelegate?
    private let middleButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMiddleButton()
        setupCustomTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMiddleButton() {
        middleButton.frame = CGRect(x: (self.bounds.width / 2) - 30, y: -20, width: 56, height: 56)
        
        middleButton.backgroundColor = UIColor.systemPink
        middleButton.layer.cornerRadius = middleButton.frame.size.height / 2
        middleButton.layer.masksToBounds = false
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.2
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        self.addSubview(middleButton)
        middleButton.setImage(AppAssets.program.load()?.resized(to: CGSize(width: 24, height: 24)), for: .normal)
        middleButton.imageView?.contentMode = .scaleAspectFit
    }
    
    @objc private func middleButtonAction() {
        delegate?.middleButtonTapped()
    }
    
    private func setupCustomTabBar() {
        // Assuming you want to keep the custom path for the tab bar
        let path = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        self.layer.insertSublayer(shape, at: 0)
    }
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.bounds.width
        let frameHeight = self.bounds.height + 40
        let holeWidth = 150
        let holeHeight = 60
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        
        let path : UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole , y: 0)) // 1.Line
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth/3), y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*6,y: 0), controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*8, y: holeHeight/2)) // part I
        
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2*holeWidth)/3, y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2/5, y: (holeHeight/2)*6/4), controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2 + (holeWidth/3)/3*3/5, y: (holeHeight/2)*6/4)) // part II
        
        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + (2*holeWidth)/3,y: holeHeight/2), controlPoint2: CGPoint(x: leftXUntilHole + (2*holeWidth)/3 + (holeWidth/3)*2/8, y: 0)) // part III
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: 0)) // 5. Line
        path.close()
        return path
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let middleButtonYPosition = self.bounds.height - (middleButton.bounds.height / 2) - 20 
           middleButton.center = CGPoint(x: self.bounds.midX, y: middleButtonYPosition)

    }
}
