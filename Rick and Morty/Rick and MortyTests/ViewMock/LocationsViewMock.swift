//
//  LocationsViewMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import UIKit
@testable import Rick_and_Morty

class LocationsViewMock : UIViewController, LocationsViewDelegate {
    
    // SPY
    var displayFetchLocationsIsCalled = false
    var starLoadingIsCalled = false
    var stopLoadingIsCalled = false
    // END SPY
    
    func displayFetchLocations(viewModel: Location.FetchLocations.ViewModel) {
        displayFetchLocationsIsCalled = true
    }
    
    func starLoading() {
        starLoadingIsCalled = true
    }
    
    func stopLoading() {
        stopLoadingIsCalled = true
    }
    
}
