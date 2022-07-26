//
//  EpisodeRepositoryMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class EpisodeRepositoryMock : EpisodeRepositoryProtocol {
    
    // SPY
    var fetchEpisodesIsCalled = false
    var fetchEpisodeIsCalled = false
    var expectation: XCTestExpectation!
    // END SPY
    
    func fetchEpisodes(request: Episode.FetchEpisodes.Request, completion: @escaping (Result<Episode.FetchEpisodes.Response, ErrorService>) -> Void) {
        
        fetchEpisodesIsCalled = true
        
        do {
            let json = "{}"
            let data = json.data(using: .utf8)!
            let response = try JSONDecoder().decode(Episode.FetchEpisodes.Response.self, from: data)
            completion(.success(response))
            
            expectation.fulfill()
        } catch let error {
            completion(.failure(.parse(error)))
        }
    }
    
    func fetchEpisode(request: Episode.FetchEpisode.Request, completion: @escaping (Result<Episode.FetchEpisode.Response, ErrorService>) -> Void) {
        
        fetchEpisodeIsCalled = true
        
        do {
            let json = "{}"
            let data = json.data(using: .utf8)!
            let response = try JSONDecoder().decode(Episode.FetchEpisode.Response.self, from: data)
            completion(.success(response))
            
            expectation.fulfill()
        } catch let error {
            completion(.failure(.parse(error)))
        }
    }
}
