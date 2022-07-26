//
//  LocationRepositoryMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class LocationRepositoryMock : LocationRepositoryProtocol {
    
    // SPY
    var fetchLocationsIsCalled = false
    var fetchLocationIsCalled = false
    var expectation: XCTestExpectation!
    // END SPY
    
    func fetchLocations(request: Location.FetchLocations.Request, completion: @escaping (Result<Location.FetchLocations.Response, ErrorService>) -> Void) {
        
        fetchLocationsIsCalled = true
        
        do {
            let json = "{}"
            let data = json.data(using: .utf8)!
            let response = try JSONDecoder().decode(Location.FetchLocations.Response.self, from: data)
            completion(.success(response))
            
            expectation.fulfill()
        } catch let error {
            completion(.failure(.parse(error)))
        }
    }
    
    func fetchLocation(request: Location.FetchLocation.Request, completion: @escaping (Result<Location.FetchLocation.Response, ErrorService>) -> Void) {
        
        fetchLocationIsCalled = true
        
        do {
            let json = "{}"
            let data = json.data(using: .utf8)!
            let response = try JSONDecoder().decode(Location.FetchLocation.Response.self, from: data)
            completion(.success(response))
            
            expectation.fulfill()
        } catch let error {
            completion(.failure(.parse(error)))
        }
    }
}
