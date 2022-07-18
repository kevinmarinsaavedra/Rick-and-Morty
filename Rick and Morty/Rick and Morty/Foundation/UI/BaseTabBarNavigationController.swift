//
//  BaseTabBarNavigationController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

class BaseTabBarNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: RickAndMortyColor.white ?? .white]
        standardAppearance.backgroundColor = RickAndMortyColor.black
        
        let scrollEdgeAppearance = standardAppearance.copy()
        let compactAppearance = standardAppearance.copy()
        
        navigationBar.tintColor = RickAndMortyColor.white
        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar.compactAppearance = compactAppearance
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
