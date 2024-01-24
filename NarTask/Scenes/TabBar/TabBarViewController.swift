//
//  TabBarViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit


protocol TabBarDisplayLogic: AnyObject {
}


final class TabBarController: UITabBarController
//                                ThemeableViewController
{
    
    //    var theme: ThemeProvider = App.theme
    
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    
    // MARK: - Lifecycle Methods
    
    private let middleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addControllers()
        self.setupUI()
        setupMiddleButton()
        setupCustomTabBar()
    }
    
    // MARK: - Private
    
    private func addControllers() {
        let homeVC = DashboardViewController()
        let homeView = MainNavigation(rootViewController: DashboardConfigurator.configure(homeVC))
        homeView.tabBarItem = UITabBarItem(title: "Əsas", image: AppAssets.main.load(), tag: 0)
        
        
        let internetVC = DashboardViewController()
        let internetView = MainNavigation(rootViewController: DashboardConfigurator.configure(internetVC))
        internetView.tabBarItem = UITabBarItem(title: "İnternet", image: AppAssets.internet.load(), tag: 1)
        
        
        // Home
        let dashboardVC = DashboardViewController()
        let dashboardView = MainNavigation(rootViewController: DashboardConfigurator.configure(dashboardVC))
        dashboardView.tabBarItem = UITabBarItem()
        dashboardView.tabBarItem.title = ""
        dashboardView.tabBarItem.image = UIImage.add
        dashboardView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        dashboardView.tabBarItem.isEnabled = false
        //        homeView.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -3)
        
        
        let supportVC = DashboardViewController()
        let supportView = MainNavigation(rootViewController: DashboardConfigurator.configure(supportVC))
        supportView.tabBarItem = UITabBarItem(title: "Dəstək", image: AppAssets.support.load(), tag: 2)
        
        
        let accountVC = DashboardViewController()
        let accountView = MainNavigation(rootViewController: DashboardConfigurator.configure(accountVC))
        accountView.tabBarItem = UITabBarItem(title: "Hesabım", image: AppAssets.account.load(), tag: 3)
        
        let controllers = [homeView, internetView, dashboardView, supportView, accountView]
        self.viewControllers = controllers
    }
    
    private func addSubviews() {
        //self.updateConstraints()
    }
    
    private func setupUI() {
        //        self.view.backgroundColor = .clear
        //        self.tabBar.isTranslucent = false
        //        self.tabBar.barTintColor = .white
        //        self.tabBar.backgroundColor = .clear
        self.tabBar.tintColor = ColorStyle.mainColor.load()
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupMiddleButton() {
        middleButton.frame = CGRect(x: (view.bounds.width / 2) - 30, y: -20 + 10, width: 56, height: 56)
        
        middleButton.backgroundColor = UIColor.systemPink
        middleButton.layer.cornerRadius = middleButton.frame.size.height / 2
        middleButton.layer.masksToBounds = false
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.2
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        tabBar.addSubview(middleButton)
        middleButton.layer.zPosition = 1
        tabBar.bringSubviewToFront(middleButton)
        middleButton.setImage(AppAssets.program.load()?.resized(to: CGSize(width: 24, height: 24)), for: .normal)
        
        // Ensure that the image content mode is set appropriately
        middleButton.imageView?.contentMode = .scaleAspectFit
        
        
    }
    
    @objc private func middleButtonAction() {
        let dashboardVC = DashboardViewController()
        self.present(dashboardVC, animated: true, completion: nil)
    }
    
    private func setupCustomTabBar() {
        let path = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(shape, at: 0)
    }
    
    
    // NOTE: check width and height
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 40
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
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Ensure the middle button is centered and positioned above the tab bar
        middleButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.minY - middleButton.bounds.height / 6 + 10)
        middleButton.layer.zPosition = 1
    }
    
    
}


extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage? {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


// MARK: - Display Logic

extension TabBarController: TabBarDisplayLogic {
    
    
}


