//
//  FreeSMSInteractor.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

protocol FreeSMSBusinessLogic {
    
    func doSomething(request: FreeSMS.Something.Request)
}

protocol FreeSMSDataStore {
    
//    var name: String { get set }
}

final class FreeSMSInteractor: FreeSMSBusinessLogic, FreeSMSDataStore {
    
    var presenter: FreeSMSPresentationLogic?
    lazy var worker: FreeSMSWorkingLogic = FreeSMSWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func doSomething(request: FreeSMS.Something.Request) {
        let response = FreeSMS.Something.Response()
        presenter?.presentLoad(response: response)
    }
}
