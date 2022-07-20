//
//  CharactersRouter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

enum CharactersRouter {
    case details(data: Characters.DataStore)
}

protocol BaseCharactersCoordinator: BaseCoordinator {
    func navigate(_ router: CharactersRouter)
}

final class CharactersCoordinator: BaseCharactersCoordinator {    
        
    var navController: UINavigationController?
    
    init(navController: UINavigationController?) {
        self.navController = navController
    }
    
    func start() -> UINavigationController?  {
                
        let viewController = CharactersViewController()
        let characterRepository = CharacterRepository(characterService: CharacterAPI())
        
        let presenter = CharactersPresenter(
            view: viewController,
            characterRepository: characterRepository,
            coordinator: self
        )
        viewController.presenter = presenter
                
        let navigation = BaseTabBarNavigationController(rootViewController: viewController)
        navController  = navigation
        
        return navController
    }
    
    func navigate(_ router: CharactersRouter) {
        switch router {
            
        case .details(let data):
            let data = CharacterDetails.DataStore(character: data.character)
            let coordinator = CharacterDetailsCoordinator(navController: navController, data: data)
            _ = coordinator.start()
        }
    }
}
