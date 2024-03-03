//
//  BaseUITabBarController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol BaseUITabBarControllerDelegate {
    func setupAppearance()
}

class BaseUITabBarController: UITabBarController {
    
}

extension BaseUITabBarController: BaseUITabBarControllerDelegate {
    
    func setupAppearance() {
        tabBar.barTintColor = RickAndMortyColor.black
        tabBar.unselectedItemTintColor = RickAndMortyColor.gray
        tabBar.tintColor = RickAndMortyColor.primary

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            // TAB BAR BACKGROUND COLOR HERE
            appearance.backgroundColor = RickAndMortyColor.black
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
