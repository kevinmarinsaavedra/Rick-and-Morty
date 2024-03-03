//
//  DetailsViewModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

enum Details {
    
    struct ViewModel {
        var id: Int?
        var title: String = ""
        var subtitle: String = ""
        var description: String = ""
    }
    
    struct DataStore {
        let id: Int
    }
}
