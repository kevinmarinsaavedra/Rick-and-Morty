//
//  CharactersPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol CharactersPresenterProtocol {
    //MARK: METHOD
    func fetchCharacters()
    
    //MARK: NAVIGATION
    func navigationDetail(character: Character.CharacterModel)
}

class CharactersPresenter: CharactersPresenterProtocol {
    
    //MARK: - VARIABLES
    
    private var coordinator: BaseCharactersCoordinator
    private weak var view: CharactersViewDelegate?
    
    init(view: CharactersViewDelegate, coordinator: BaseCharactersCoordinator) {
        self.coordinator = coordinator
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchCharacters() {
        let viewModel = Character.FetchCharacters.ViewModel(characters: [
            Character.CharacterModel(name: "Rick", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/78.jpeg"),
            Character.CharacterModel(name: "Morty", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/77.jpeg"),
            Character.CharacterModel(name: "Fleeb", status: .unknown , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/66.jpeg"),
            Character.CharacterModel(name: "Kristen Stewart", status: .dead , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/55.jpeg"),
            Character.CharacterModel(name: "Rick", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/56.jpeg"),
            Character.CharacterModel(name: "Morty", status: .dead , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/57.jpeg"),
            Character.CharacterModel(name: "Fleeb", status: .unknown , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/45.jpeg"),
            Character.CharacterModel(name: "Kristen Stewart", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/33.jpeg"),
            Character.CharacterModel(name: "Rick", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/58.jpeg"),
            Character.CharacterModel(name: "Morty", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/51.jpeg"),
            Character.CharacterModel(name: "Fleeb", status: .unknown , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/52.jpeg"),
            Character.CharacterModel(name: "Kristen Stewart", status: .alive , species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/50.jpeg")
        ])
        
        view?.displayFetchCharacters(viewModel: viewModel)
    }
    
    //MARK: - NAVIGATION
    func navigationDetail(character: Character.CharacterModel) {
        let data = Characters.DataStore(character: character)
        coordinator.navigate(.details(data: data))
    }
}
