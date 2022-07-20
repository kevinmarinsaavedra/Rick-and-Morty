//
//  CharacterDetailsViewModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import Foundation

enum CharacterDetails {
    
    struct ViewModel {
        var character : Character.CharacterModel?
    }
    
    struct DataStore {
        var character : Character.CharacterModel
    }
}
