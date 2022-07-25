//
//  LocationDetailsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

class LocationDetailsPresenter: DetailsPresenterProtocol {

    //MARK: - VARIABLES
    
    private let locationRepository: LocationRepositoryProtocol
    private weak var view: DetailsViewDelegate?
    
    init(view: DetailsViewDelegate, locationRepository: LocationRepositoryProtocol) {
        self.locationRepository = locationRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchTitleView() {
        view?.displayFetchTitleView(title: "Location details")
    }
    
    func fetchDetails(id: Int) {
        
        let request = Location.FetchLocation.Request(id: id)
        
        //self.view?.starLoading()
        
        locationRepository.fetchLocation(request: request) { result in
            
            //self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                let viewModel = DetailsModel.FetchDetails.ViewModel(
                    title: data.name,
                    subtitle: data.type,
                    description: data.dimension
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
