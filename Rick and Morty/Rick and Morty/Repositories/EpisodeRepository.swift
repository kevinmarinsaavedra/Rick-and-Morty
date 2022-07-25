//
//  EpisodeRepository.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

protocol EpisodeRepositoryProtocol {
    func fetchEpisodes(request: Episode.FetchEpisodes.Request ,completion: @escaping (Result<Episode.FetchEpisodes.Response,ErrorService>) -> Void)
    func fetchEpisode(request: Episode.FetchEpisode.Request ,completion: @escaping (Result<Episode.FetchEpisode.Response,ErrorService>) -> Void)
}

final class EpisodeRepository: EpisodeRepositoryProtocol {
    
    var episodeService: EpisodeServiceProtocol?
    
    init(episodeService: EpisodeServiceProtocol) {
        self.episodeService = episodeService
    }
    
    func fetchEpisodes(request: Episode.FetchEpisodes.Request, completion: @escaping (Result<Episode.FetchEpisodes.Response,ErrorService>) -> Void) {

        episodeService?.fetchEpisodes(request: request) { (result) in
            completion(result)
        }
    }
    
    func fetchEpisode(request: Episode.FetchEpisode.Request, completion: @escaping (Result<Episode.FetchEpisode.Response,ErrorService>) -> Void) {

        episodeService?.fetchEpisode(request: request) { (result) in
            completion(result)
        }
    }
}
