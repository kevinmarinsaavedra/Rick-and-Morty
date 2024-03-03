//
//  DerailsRouter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

final class DetailsCoordinator: BaseGeneralCoordinator {
        
    var navController: UINavigationController?
    
    init(navController: UINavigationController?) {
        self.navController = navController
    }
    
    func start(viewController: UIViewController) -> UINavigationController?  {
                
        viewController.hidesBottomBarWhenPushed = true
        navController?.pushViewController(viewController, animated: true)
        
        return navController
    }
}
