//
//  LocationsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import Foundation

protocol LocationsPresenterProtocol {
    //MARK: METHOD
    func fetchLocations(request: Location.FetchLocations.Request)
    
    //MARK: NAVIGATION
    func navigationDetails(location: Location.LocationModel)
}

class LocationsPresenter: LocationsPresenterProtocol {
    
    //MARK: - VARIABLES
    
    private var coordinator: BaseLocationsCoordinator
    private let locationRepository: LocationRepositoryProtocol
    private weak var view: LocationsViewDelegate?
    
    init(view: LocationsViewDelegate?, locationRepository: LocationRepositoryProtocol, coordinator: BaseLocationsCoordinator) {
        self.coordinator = coordinator
        self.locationRepository = locationRepository
        self.view = view
    }
    
    //MARK: - METHOD
    
    func fetchLocations(request: Location.FetchLocations.Request) {
        
        self.view?.starLoading()
        
        locationRepository.fetchLocations(request: request) { result in
            
            self.view?.stopLoading()
            
            switch result {
            case .success(let data):
                let viewModel = Location.FetchLocations.ViewModel(locations: data.results ?? [])
                
                self.view?.displayFetchLocations(viewModel: viewModel)
            case .failure(let error):
                print(error.description)
                return
            }
        }
    }
    
    //MARK: - NAVIGATION
    func navigationDetails(location: Location.LocationModel) {
        let data = Locations.DataStore(location: location)
        coordinator.navigate(.details(data: data))
    }
}
