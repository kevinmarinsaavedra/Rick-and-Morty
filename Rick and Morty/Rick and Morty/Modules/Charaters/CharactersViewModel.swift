//
//  CharactersViewModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import Foundation

enum Characters {
    
    struct ViewModel {
        var characters : [Character.CharacterModel] = []
    }
    
    struct DataStore {
        var character : Character.CharacterModel
    }
}
