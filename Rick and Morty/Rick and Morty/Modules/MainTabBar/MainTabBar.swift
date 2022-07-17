//
//  MainTabBar.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

class MainTabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = UIColor(hexString: "222427")
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .white

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            // TAB BAR BACKGROUND COLOR HERE. (same as above)
            appearance.backgroundColor = UIColor(hexString: "181818")
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }
        
        //First Tab
        let charactersVC = CharactersViewController()
        
        charactersVC.tabBarItem = UITabBarItem(
            title: "Characters",
            image: UIImage(systemName: "person.crop.rectangle.stack.fill"),
            selectedImage: UIImage(systemName: "person.crop.rectangle.stack.fill")
        )
        charactersVC.tabBarItem.tag = 0
        
        //Second Tab
        let locationsVC = LocationsViewController()
        
        locationsVC.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "person.fill"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        locationsVC.tabBarItem.tag = 1
        
        //Third tab
        let episodesVC = EpisodesViewController()
        
        episodesVC.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "play.rectangle.on.rectangle.fill"),
            selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill")
        )
        episodesVC.tabBarItem.tag = 2
        
        let controllers = [charactersVC, locationsVC, episodesVC]
        viewControllers = controllers
    }
}
