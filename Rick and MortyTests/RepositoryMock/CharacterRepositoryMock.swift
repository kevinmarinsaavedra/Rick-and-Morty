//
//  File.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class CharacterRepositoryMock: CharacterRepositoryProtocol {
    
    // SPY
    var fetchCharactersIsCalled = false
    var expectation: XCTestExpectation!
    // END SPY
    
    func fetchCharacters(request: Character.FetchCharacters.Request, completion: @escaping (Result<Character.FetchCharacters.Response, ErrorService>) -> Void) {
        
        fetchCharactersIsCalled = true
        
        do {
            let json = "{}"
            let data = json.data(using: .utf8)!
            let response = try JSONDecoder().decode(Character.FetchCharacters.Response.self, from: data)
            completion(.success(response))
            
            expectation.fulfill()
        } catch let error {
            completion(.failure(.parse(error)))
        }
    }
}
