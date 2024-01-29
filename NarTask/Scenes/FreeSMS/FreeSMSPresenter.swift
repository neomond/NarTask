//
//  FreeSMSPresenter.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

protocol FreeSMSPresentationLogic {
    
    func presentLoad(response: FreeSMS.Load.Response)
}

final class FreeSMSPresenter: FreeSMSPresentationLogic {
    
    weak var viewController: FreeSMSDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: FreeSMS.Load.Response) {
        let viewModel = FreeSMS.Load.ViewModel()
//        viewController?.displayLoad(viewModel: viewModel)
    }
}
