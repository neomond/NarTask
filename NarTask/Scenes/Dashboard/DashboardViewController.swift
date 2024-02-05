//
//  DashboardViewController.swift
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
import SnapKit

protocol DashboardDisplayLogic: AnyObject {
    func displayStories(viewModel: Dashboard.Something.ViewModel)
}

class DashboardViewController: UIViewController, DashboardDisplayLogic {
    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    var mainView: DashboardView!
    
    var stories: [StoryModel] = []
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.storiesCollectionView.delegate = self
        mainView.storiesCollectionView.dataSource = self
        mainView.servicesGridView.delegate = self
        self.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func load() {
        let request = Dashboard.Something.Request()
        interactor?.fetchStories(request: request)
    }
    
    func displayStories(viewModel: Dashboard.Something.ViewModel) {
        self.stories = viewModel.stories
        //nameTextField.text = viewModel.name
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == mainView.storiesCollectionView ? stories.count : 0
    }
    
    // ::here ->  add story as the current window
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == mainView.storiesCollectionView {
            let storyView = StoryView(frame: UIScreen.main.bounds, stories: stories)
            storyView.configure(with: stories[indexPath.row].image, completion: {
    // ::here -> mark the story as watched when StoryView is closed
                self.stories[indexPath.row].isSeen = true
                collectionView.reloadItems(at: [indexPath])
    // ::here -> reload the cell to update its appearance
            })
            storyView.startStory()
            
            if let currentWindow = view.window {
                currentWindow.addSubview(storyView)
            }
        }
    }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard collectionView == mainView.storiesCollectionView,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCircleCell.reuseIdentifier, for: indexPath) as? StoryCircleCell else {
                return UICollectionViewCell()
            }
            
            let story =  stories[indexPath.row]
            cell.imageView.image = story.image
            cell.setWatched(story.isSeen)
            return cell
        }
    }
    
    
    extension DashboardViewController: ServicesGridViewDelegate {
        func didSelectService(_ service: ServiceType) {
            switch service {
            case .freeSMS:
                router?.routeToFreeSMS()
            case .balanceTransfer:
                router?.routeToBalanceTransfer()
            case .servicesAbroad:
                router?.routeToVAS()
            default:
                break
            }
        }
    }
    
    
