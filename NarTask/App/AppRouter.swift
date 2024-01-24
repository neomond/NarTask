//
//  AppRouter.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()
//        self.signIn()
    }

    func main() {
        let viewController = TabBarController()
        TabBarConfigurator.configure(viewController)
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
    
//    func signIn() {
//        let viewController = SignInViewController()
//        SignInConfigurator.configure(viewController)
//        let navigation = MainNavigation(rootViewController: viewController)
//        self.window.rootViewController = navigation
//        self.window.makeKeyAndVisible()
//    }

}
