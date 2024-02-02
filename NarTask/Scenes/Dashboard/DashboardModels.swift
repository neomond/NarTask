//
//  DashboardModels.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Dashboard
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        let stories: StoriesResponse
//        let data: ServicesCustom
    }
    struct ViewModel
    {
        let stories: [StoryModel]
//        let data: ServicesCustom
        
    }
  }
    
//    struct ServicesCustom {
//        let title: String
//        let image: String
//    }
}
struct StoryModel {
    let image: UIImage
    var isSeen: Bool = false
}
