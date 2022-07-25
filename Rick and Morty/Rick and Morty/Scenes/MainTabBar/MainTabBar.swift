//
//  MainTabBar.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

class MainTabBarController: BaseUITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.setupAppearance()
        
        //First Tab
        let charactersCoordinator = CharactersCoordinator(navController: self.navigationController)
        
        guard let charactersVC = charactersCoordinator.start() else {
            return
        }
        
        charactersVC.tabBarItem = UITabBarItem(
            title: "Characters",
            image: UIImage(systemName: "person.crop.rectangle.stack.fill"),
            tag: 0
        )
        
        //Second Tab
        let locationsCoordinator = LocationsCoordinator(navController: self.navigationController)
        
        guard let locationsVC = locationsCoordinator.start() else {
            return
        }
        
        locationsVC.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "gyroscope"),
            tag: 1
        )
        
        //Third tab
        let episodesCoordinator = EpisodesCoordinator(navController: self.navigationController)

        guard let episodesVC = episodesCoordinator.start() else {
            return
        }
        
        episodesVC.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "play.rectangle.on.rectangle.fill"),
            tag: 2
        )
        
        let controllers = [charactersVC, locationsVC, episodesVC]
        viewControllers = controllers
    }
}
