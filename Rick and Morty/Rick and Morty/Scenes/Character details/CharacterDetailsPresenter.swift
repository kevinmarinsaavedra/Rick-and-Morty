//
//  CharacterDetailsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit

protocol CharacterDetailsPresenterProtocol {
    //MARK: METHOD
    
    //MARK: NAVIGATION
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    //MARK: - VARIABLES
    
    private var coordinator: BaseCharacterDetailsCoordinator
    private let characterRepository: CharacterRepositoryProtocol
    private weak var view: CharacterDetailsViewDelegate?
    
    init(view: CharacterDetailsViewDelegate, characterRepository: CharacterRepositoryProtocol, coordinator: BaseCharacterDetailsCoordinator) {
        self.coordinator = coordinator
        self.characterRepository = characterRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    //MARK: - NAVIGATION
}
