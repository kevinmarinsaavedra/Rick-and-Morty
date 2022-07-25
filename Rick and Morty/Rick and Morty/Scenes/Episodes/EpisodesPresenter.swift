//
//  EpisodesPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import Foundation

protocol EpisodesPresenterProtocol {
    //MARK: METHOD
    func fetchEpisodes(request: Episode.FetchEpisodes.Request)
    
    //MARK: NAVIGATION
    func navigationDetail(episode: Episode.EpisodeModel)
}

class EpisodesPresenter: EpisodesPresenterProtocol {
    
    //MARK: - VARIABLES
    
    private var coordinator: BaseEpisodesCoordinator
    private let episodeRepository: EpisodeRepositoryProtocol
    private weak var view: EpisodesViewDelegate?
    
    init(view: EpisodesViewDelegate, episodeRepository: EpisodeRepositoryProtocol, coordinator: BaseEpisodesCoordinator) {
        self.coordinator = coordinator
        self.episodeRepository = episodeRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchEpisodes(request: Episode.FetchEpisodes.Request) {
        
        self.view?.starLoading()
        
        episodeRepository.fetchEpisodes(request: request) { result in
            
            self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                let viewModel = Episode.FetchEpisodes.ViewModel(episodes: data.results ?? [])
                
                self.view?.displayFetchEpisodes(viewModel: viewModel)
            case .failure(let error):
                print(error.description)
                return
            }
        }
    }
    
    //MARK: - NAVIGATION
    func navigationDetail(episode: Episode.EpisodeModel) {
        let data = Episodes.DataStore(episode: episode)
        coordinator.navigate(.details(data: data))
    }
}
