//
//  EpisodesModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import Foundation

enum Episodes {
    
    struct ViewModel {
        var episodes : [Episode.EpisodeModel] = []
    }
    
    struct DataStore {
        var episode : Episode.EpisodeModel
    }
}
