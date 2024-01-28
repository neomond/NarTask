//
//  FreeSMSInteractor.swift
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

protocol FreeSMSBusinessLogic
{
  func doSomething(request: FreeSMS.Something.Request)
}

protocol FreeSMSDataStore
{
  //var name: String { get set }
}

class FreeSMSInteractor: FreeSMSBusinessLogic, FreeSMSDataStore
{
  var presenter: FreeSMSPresentationLogic?
  var worker: FreeSMSWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: FreeSMS.Something.Request)
  {
    worker = FreeSMSWorker()
    worker?.doSomeWork()
    
    let response = FreeSMS.Something.Response()
    presenter?.presentSomething(response: response)
  }
}