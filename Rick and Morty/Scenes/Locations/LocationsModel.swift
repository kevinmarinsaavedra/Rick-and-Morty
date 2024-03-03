//
//  LocationsModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import Foundation

enum Locations {
    
    struct ViewModel {
        var locations : [Location.LocationModel] = []
    }
    
    struct DataStore {
        var location : Location.LocationModel
    }
}
