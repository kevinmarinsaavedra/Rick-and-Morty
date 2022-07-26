//
//  EpisodeDetailsViewMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import UIKit
@testable import Rick_and_Morty

class LocationDetailsViewMock : UIViewController, DetailsViewDelegate {
    
    // SPY
    var displayFetchTitleValue = ""
    
    var displayFetchTitleIsCalled = false
    var displayFetchDetailsIsCalled = false
    var starLoadingIsCalled = false
    var stopLoadingIsCalled = false
    // END SPY
    
    func displayFetchTitleView(title: String) {
        displayFetchTitleIsCalled = true
        displayFetchTitleValue = title
    }
    
    func displayFetchDetails(viewModel: DetailsModel.FetchDetails.ViewModel) {
        displayFetchDetailsIsCalled = true
    }
    
    func starLoading() {
        starLoadingIsCalled = true
    }
    
    func stopLoading() {
        stopLoadingIsCalled = true
    }
    
}
