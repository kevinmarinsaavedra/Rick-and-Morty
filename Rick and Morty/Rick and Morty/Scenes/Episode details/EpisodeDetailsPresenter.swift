//
//  EpisodeDetailsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

class EpisodeDetailsPresenter: DetailsPresenterProtocol {

    //MARK: - VARIABLES
    
    private let episodeRepository: EpisodeRepositoryProtocol
    private weak var view: DetailsViewDelegate?
    
    init(view: DetailsViewDelegate, episodeRepository: EpisodeRepositoryProtocol) {
        self.episodeRepository = episodeRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchTitleView() {
        view?.displayFetchTitleView(title: "Episode details")
    }
    
    func fetchDetails(id: Int) {
        
        let request = Episode.FetchEpisode.Request(id: id)
        
        self.view?.starLoading()
        
        episodeRepository.fetchEpisode(request: request) { result in
            
            self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                
                let viewModel = DetailsModel.FetchDetails.ViewModel(
                    title: data.name,
                    subtitle: data.airDate,
                    description: data.episode
                )
                
                self.view?.displayFetchDetails(viewModel: viewModel)
            case .failure(let error):
                print(error.description)
                return
            }
        }
    }
    
    //MARK: - NAVIGATION
}
