//
//  CharacterDetailsRouter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit

enum CharacterDetailsRouter {
    //EMPTY
}

protocol BaseCharacterDetailsCoordinator: BaseCoordinator {
    func navigate(_ router: CharactersRouter)
}

final class CharacterDetailsCoordinator: BaseCharacterDetailsCoordinator {
        
    var navController: UINavigationController?
    var data: CharacterDetails.DataStore
    
    init(navController: UINavigationController?, data: CharacterDetails.DataStore) {
        self.navController = navController
        self.data = data
    }
    
    func start() -> UINavigationController?  {
                
        let viewController = CharacterDetailsViewController()
        let characterRepository = CharacterRepository(characterService: CharacterAPI())
        
        viewController.viewModel.character = data.character
        
        let presenter = CharacterDetailsPresenter(
            view: viewController,
            characterRepository: characterRepository,
            coordinator: self
        )
        viewController.presenter = presenter
                
        viewController.hidesBottomBarWhenPushed = true
        navController?.pushViewController(viewController, animated: true)
        
        return navController
    }
    
    func navigate(_ router: CharactersRouter) {
        switch router {
            
        case .details(_):
            /*let data = LDRTruckDetails.DataStore(truck: data.truck)
            let coordinator = LDRTruckDetailsCoordinator(navController: navController, data: data)
            _ = coordinator.start()*/
            break
        }
    }
}
