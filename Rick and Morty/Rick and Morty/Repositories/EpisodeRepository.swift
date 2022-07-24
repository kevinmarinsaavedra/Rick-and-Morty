//
//  EpisodeRepository.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

protocol EpisodeRepositoryProtocol {
    func fetchEpisodes(request: Episode.FetchEpisodes.Request ,completion: @escaping (Result<Episode.FetchEpisodes.Response,ErrorService>) -> Void)
}

final class EpisodeRepository: EpisodeRepositoryProtocol {
    
    var characterService: EpisodeServiceProtocol?
    
    init(characterService: EpisodeServiceProtocol) {
        self.characterService = characterService
    }
    
    func fetchEpisodes(request: Episode.FetchEpisodes.Request, completion: @escaping (Result<Episode.FetchEpisodes.Response,ErrorService>) -> Void) {

        characterService?.fetchEpisodes(request: request) { (result) in
            completion(result)
        }
    }
}
