//
//  LocationRepository.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

protocol LocationRepositoryProtocol {
    func fetchLocations(request: Location.FetchLocations.Request ,completion: @escaping (Result<Location.FetchLocations.Response,ErrorService>) -> Void)
}

final class LocationRepository: LocationRepositoryProtocol {
    
    var characterService: LocationServiceProtocol?
    
    init(characterService: LocationServiceProtocol) {
        self.characterService = characterService
    }
    
    func fetchLocations(request: Location.FetchLocations.Request, completion: @escaping (Result<Location.FetchLocations.Response,ErrorService>) -> Void) {

        characterService?.fetchLocations(request: request) { (result) in
            completion(result)
        }
    }
}
