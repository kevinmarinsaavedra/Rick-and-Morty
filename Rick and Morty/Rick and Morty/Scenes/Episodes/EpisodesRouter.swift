//
//  EpisodesRouter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

enum EpisodesRouter {
    case details(data: Episodes.DataStore)
}

protocol BaseEpisodesCoordinator: BaseCoordinator {
    func navigate(_ router: EpisodesRouter)
}

final class EpisodesCoordinator: BaseEpisodesCoordinator {
        
    var navController: UINavigationController?
    
    init(navController: UINavigationController?) {
        self.navController = navController
    }
    
    func start() -> UINavigationController?  {
                
        let viewController = EpisodesViewController()
        let locationRepository = EpisodeRepository(episodeService: EpisodeAPI())
        
        let presenter = EpisodesPresenter(
            view: viewController,
            episodeRepository: locationRepository,
            coordinator: self
        )
        viewController.presenter = presenter
                
        let navigation = BaseTabBarNavigationController(rootViewController: viewController)
        navController  = navigation
        
        return navController
    }
    
    func navigate(_ router: EpisodesRouter) {
        switch router {
            
        case .details(let data):
            
            let coordinator = DetailsCoordinator(navController: navController)
            
            let episodeRepository = EpisodeRepository(episodeService: EpisodeAPI())
            let viewController = DetailsViewController()
            let presenter = EpisodeDetailsPresenter(
                view: viewController,
                episodeRepository: episodeRepository
            )
            
            viewController.presenter = presenter
            viewController.viewModel.id = data.episode.id
            
            _ = coordinator.start(viewController: viewController)
        }
    }
}
