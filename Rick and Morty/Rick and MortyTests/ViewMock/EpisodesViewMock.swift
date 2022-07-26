//
//  EpisodesViewMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import UIKit
@testable import Rick_and_Morty

class EpisodesViewMock : UIViewController, EpisodesViewDelegate {
    
    // SPY
    var displayFetchEpisodesIsCalled = false
    var starLoadingIsCalled = false
    var stopLoadingIsCalled = false
    // END SPY
    
    func displayFetchEpisodes(viewModel: Episode.FetchEpisodes.ViewModel) {
        displayFetchEpisodesIsCalled = true
    }
    
    func starLoading() {
        starLoadingIsCalled = true
    }
    
    func stopLoading() {
        stopLoadingIsCalled = true
    }
    
}
