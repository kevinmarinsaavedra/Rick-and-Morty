//
//  CharactersPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit
import Alamofire

protocol CharactersPresenterProtocol {
    //MARK: METHOD
    func fetchCharacters(request: Character.FetchCharacters.Request)
    
    //MARK: NAVIGATION
    func navigationDetail(character: Character.CharacterModel)
}

class CharactersPresenter: CharactersPresenterProtocol {
    
    //MARK: - VARIABLES
    
    private var coordinator: BaseCharactersCoordinator
    private let characterRepository: CharacterRepositoryProtocol
    private weak var view: CharactersViewDelegate?
    
    init(view: CharactersViewDelegate, characterRepository: CharacterRepositoryProtocol, coordinator: BaseCharactersCoordinator) {
        self.coordinator = coordinator
        self.characterRepository = characterRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchCharacters(request: Character.FetchCharacters.Request) {
        
        //self.view?.starLoading()
        
        characterRepository.fetchCharacters(request: request) { result in
            
            //self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                let viewModel = Character.FetchCharacters.ViewModel(characters: data.results ?? [])
                
                self.view?.displayFetchCharacters(viewModel: viewModel)
            case .failure(let error):
                print(error.description)
                return
            }
        }
    }
    
    //MARK: - NAVIGATION
    func navigationDetail(character: Character.CharacterModel) {
        let data = Characters.DataStore(character: character)
        coordinator.navigate(.details(data: data))
    }
}
