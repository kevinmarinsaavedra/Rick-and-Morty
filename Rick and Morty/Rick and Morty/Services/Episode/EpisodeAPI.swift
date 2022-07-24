//
//  EpisodeAPI.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

protocol EpisodeServiceProtocol  {
    func fetchEpisodes(request: Episode.FetchEpisodes.Request, completion: @escaping (Result<Episode.FetchEpisodes.Response,ErrorService>) -> Void)
}

final class EpisodeAPI: EpisodeServiceProtocol {
    
    func fetchEpisodes(request: Episode.FetchEpisodes.Request, completion: @escaping (Result<Episode.FetchEpisodes.Response, ErrorService>) -> Void) {
                
        guard let parameter = (request.parameters != nil) ? try? request.parameters.asDictionary() : nil else {
            completion(.failure(ErrorService.parameters))
            return
        }
        
        NetworkService.share.request(endpoint: EpisodeEndpoint.fetchEpisodes(parameters: parameter)) { result in
            
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Episode.FetchEpisodes.Response.self, from: data)
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
