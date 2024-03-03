//
//  CharactersViewMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import UIKit
@testable import Rick_and_Morty

class CharactersViewMock: UIViewController, CharactersViewDelegate {
    
    // SPY
    var displayFetchCharactersIsCalled = false
    var starLoadingIsCalled = false
    var stopLoadingIsCalled = false
    // END SPY
    
    func displayFetchCharacters(viewModel: Character.FetchCharacters.ViewModel) {
        displayFetchCharactersIsCalled = true
    }
    
    func starLoading() {
        starLoadingIsCalled = true
    }
    
    func stopLoading() {
        stopLoadingIsCalled = true
    }
}
