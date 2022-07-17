//
//  AppCoordinator.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol BaseCoordinator {
    func start() -> UINavigationController
}

final class AppCoordinator: BaseCoordinator {

    var navController: UINavigationController?
    
    func start() -> UINavigationController {
        
        let viewController = MainTabBarController()
        let navController = UINavigationController(rootViewController: viewController)
        self.navController = navController
        
        return navController
    }

}
