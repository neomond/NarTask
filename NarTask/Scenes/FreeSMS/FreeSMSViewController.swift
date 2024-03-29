//
//  FreeSMSViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 26.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FreeSMSDisplayLogic: AnyObject {
    func displaySomething(viewModel: FreeSMS.Something.ViewModel)
}

class FreeSMSViewController: UIViewController, FreeSMSDisplayLogic
{
    func displaySomething(viewModel: FreeSMS.Something.ViewModel) { }
    
    var interactor: FreeSMSBusinessLogic?
    var router: (NSObjectProtocol & FreeSMSRoutingLogic & FreeSMSDataPassing)?
    
    var mainView: FreeSMSView!
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.load()
        
        self.view = mainView
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = "Pulsuz SMS"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        appearance.backgroundColor = UIColor(.white)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    
    // MARK: Load
    func load()
    {
        let request = FreeSMS.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: BalanceTransfer.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    
}
