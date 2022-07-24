//
//  LocationAPI.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

protocol LocationServiceProtocol  {
    func fetchLocations(request: Location.FetchLocations.Request, completion: @escaping (Result<Location.FetchLocations.Response,ErrorService>) -> Void)
}

final class LocationAPI: LocationServiceProtocol {
    
    func fetchLocations(request: Location.FetchLocations.Request, completion: @escaping (Result<Location.FetchLocations.Response, ErrorService>) -> Void) {
                
        guard let parameter = (request.parameters != nil) ? try? request.parameters.asDictionary() : nil else {
            completion(.failure(ErrorService.parameters))
            return
        }
        
        NetworkService.share.request(endpoint: LocationEndpoint.fetchLocations(parameters: parameter)) { result in
            
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Location.FetchLocations.Response.self, from: data)
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
