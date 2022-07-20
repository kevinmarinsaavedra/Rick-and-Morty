//
//  CharacterDetailsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit

protocol CharacterDetailsPresenterProtocol {
    //MARK: METHOD
    func fetchCharacter()
    
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
    
    func fetchCharacter() {
        /*
        //self.view?.starLoading()
        
        characterRepository.fetchCharacters() { result in
            
            //self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                let viewModel = Character.FetchCharacters.ViewModel(characters: data.results ?? [])
                
                self.view?.displayFetchCharacter(viewModel: viewModel)
            case .failure(let error):
                print(error.description)
                return
            }
        }*/
    }
    
    //MARK: - NAVIGATION
}
