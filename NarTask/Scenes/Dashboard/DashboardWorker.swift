//
//  DashboardWorker.swift
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

struct StoriesResponse {
    let stories: [StoryResponse]
}

struct StoryResponse {
    let image: UIImage
    let isSeen: Bool
}

protocol DashboardWorkerLogic {
    func fetchStories(completion: @escaping (StoriesResponse) -> Void)
}

class DashboardWorker: DashboardWorkerLogic
{
    func fetchStories(completion: @escaping (StoriesResponse) -> Void) {
        //assume that this story array is came from API
        
        let storiesResponse: StoriesResponse = StoriesResponse(stories: [
            StoryResponse(image: UIImage(named: "StoryImage")!, isSeen: false),
            StoryResponse(image: UIImage(named: "StoryImage1")!, isSeen: false),
            StoryResponse(image: UIImage(named: "StoryImage2")!, isSeen: false),
            StoryResponse(image: UIImage(named: "StoryImage3")!, isSeen: false),
            StoryResponse(image: UIImage(named: "StoryImage4")!, isSeen: false)
            
        ])
        completion(storiesResponse)
    }
}
