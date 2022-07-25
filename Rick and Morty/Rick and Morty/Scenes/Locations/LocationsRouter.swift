//
//  LocationsRouter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

enum LocationsRouter {
    case details(data: Locations.DataStore)
}

protocol BaseLocationsCoordinator: BaseCoordinator {
    func navigate(_ router: LocationsRouter)
}

final class LocationsCoordinator: BaseLocationsCoordinator {
        
    var navController: UINavigationController?
    
    init(navController: UINavigationController?) {
        self.navController = navController
    }
    
    func start() -> UINavigationController?  {
                
        let viewController = LocationsViewController()
        let locationRepository = LocationRepository(locationService: LocationAPI())
        
        let presenter = LocationsPresenter(
            view: viewController,
            locationRepository: locationRepository,
            coordinator: self
        )
        viewController.presenter = presenter
                
        let navigation = BaseTabBarNavigationController(rootViewController: viewController)
        navController  = navigation
        
        return navController
    }
    
    func navigate(_ router: LocationsRouter) {
        switch router {
            
        case .details(let data):
            
            let coordinator = DetailsCoordinator(navController: navController)
            
            let locationRepository = LocationRepository(locationService: LocationAPI())
            let viewController = DetailsViewController()
            let presenter = LocationDetailsPresenter(
                view: viewController,
                locationRepository: locationRepository
            )
            
            viewController.presenter = presenter
            viewController.viewModel.id = data.location.id
            
            _ = coordinator.start(viewController: viewController)
        }
    }
}
