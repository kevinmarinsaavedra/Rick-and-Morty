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
    
    var locationService: LocationServiceProtocol?
    
    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
    }
    
    func fetchLocations(request: Location.FetchLocations.Request, completion: @escaping (Result<Location.FetchLocations.Response,ErrorService>) -> Void) {

        locationService?.fetchLocations(request: request) { (result) in
            completion(result)
        }
    }
}
