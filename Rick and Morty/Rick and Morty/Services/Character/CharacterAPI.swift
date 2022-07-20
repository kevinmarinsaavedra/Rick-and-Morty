//
//  CharacterAPI.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import Foundation

protocol CharacterServiceProtocol  {
    func fetchCharacters(request: Character.FetchCharacters.Request, completion: @escaping (Result<Character.FetchCharacters.Response,ErrorService>) -> Void)
}

final class CharacterAPI: CharacterServiceProtocol {
    
    func fetchCharacters(request: Character.FetchCharacters.Request, completion: @escaping (Result<Character.FetchCharacters.Response, ErrorService>) -> Void) {
                
        guard let parameter = (request.parameters != nil) ? try? request.parameters.asDictionary() : nil else {
            completion(.failure(ErrorService.parameters))
            return
        }
        
        NetworkService.share.request(endpoint: CharacterEndpoint.fetchCharacters(parameters: parameter)) { result in
            
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Character.FetchCharacters.Response.self, from: data)
                    completion(.success(response))
                } catch let error {
                    print(error)
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
