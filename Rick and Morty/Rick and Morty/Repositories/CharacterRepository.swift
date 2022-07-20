//
//  CharacterRepository.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func fetchCharacters(request: Character.FetchCharacters.Request ,completion: @escaping (Result<Character.FetchCharacters.Response,ErrorService>) -> Void)
}

final class CharacterRepository: CharacterRepositoryProtocol {
    
    var characterService: CharacterServiceProtocol?
    
    init(characterService: CharacterServiceProtocol) {
        self.characterService = characterService
    }
    
    func fetchCharacters(request: Character.FetchCharacters.Request, completion: @escaping (Result<Character.FetchCharacters.Response,ErrorService>) -> Void) {

        characterService?.fetchCharacters(request: request) { (result) in
            completion(result)
        }
    }
}
