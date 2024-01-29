//
//  DashboardRouter.swift
//  TestApp
//
//  Created by Saleh Majidov on 22/01/2024.
//

import UIKit

@objc protocol DashboardRoutingLogic {
    
    func routeToFreeSMS()
    func routeToBalanceTransfer()
    func routeToVAS()
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

final class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing {
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
    
    
    // MARK: Routing
    func routeToFreeSMS() {
        let destinationVC = FreeSMSViewController()
        FreeSMSConfigurator.configure(destinationVC)
        
        var destinationDS = destinationVC.router!.dataStore!
        passDataToFreeSMS(source: dataStore!, destination: &destinationDS)
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToFreeSMS(source: viewController!, destination: destinationVC)
    }
    
    func routeToBalanceTransfer() {
        let destinationVC = BalanceTransferViewController()
        BalanceTransferConfigurator.configure(destinationVC)
        
        var destinationDS = destinationVC.router!.dataStore!
        passDataToBalanceTransfer(source: dataStore!, destination: &destinationDS)
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToBalanceTransfer(source: viewController!, destination: destinationVC)
    }
    
    func routeToVAS() {
        let destinationVC = VASViewController()
        VASConfigurator.configure(destinationVC)
        
        var destinationDS = destinationVC.router!.dataStore!
        passDataToVAS(source: dataStore!, destination: &destinationDS)
        
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToVAS(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToFreeSMS(source: DashboardViewController, destination: FreeSMSViewController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToBalanceTransfer(source: DashboardViewController, destination: BalanceTransferViewController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToVAS(source: DashboardViewController, destination: VASViewController) {
        source.show(destination, sender: nil)
    }
    
    
    // MARK: Passing data
    
    func passDataToFreeSMS(source: DashboardDataStore, destination: inout FreeSMSDataStore) {
        //        destination.name = source.name
    }
    func passDataToBalanceTransfer(source: DashboardDataStore, destination: inout BalanceTransferDataStore) {
        //               destination.name = source.name
    }
    
    func passDataToVAS(source: DashboardDataStore, destination: inout  VASDataStore) {
        //               destination.name = source.name
    }
    
    
}
