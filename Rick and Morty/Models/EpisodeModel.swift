//
//  EpisodeModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

enum Episode {
    
    //FetchEpisodes
    enum FetchEpisodes {
        struct Request: Codable {
            var parameters: Parameters?
        }
        
        class Response: ResponseBase<[EpisodeModel]> {
            
        }
        
        struct ViewModel {
            let episodes: [EpisodeModel]
        }
    }
    
    //FetchLocation
    enum FetchEpisode {
        struct Request: Codable {
            var id: Int?
        }
        
        class Response: EpisodeModel {
            
        }
        
        struct ViewModel {
            let episode: EpisodeModel
        }
    }
    
    //MARK: - MODEL
    
    // MARK: - Parameters
    struct Parameters: Codable {
        let name: String?
        var page: Int?

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case page = "page"
        }
    }

    // MARK: - EpisodeModel
    class EpisodeModel: Codable {
        var id: Int?
        var name: String?
        var airDate: String?
        var episode: String?
        var characters: [String]?
        var url: String?
        var created: String?

        init( id: Int?, name: String?, airDate: String?, episode: String?, characters: [String]?, url: String?, created: String?) {
            self.id = id
            self.name = name
            self.airDate = airDate
            self.episode = episode
            self.characters = characters
            self.url = url
            self.created = created
        }
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case airDate = "air_date"
            case episode = "episode"
            case characters = "characters"
            case url = "url"
            case created = "created"
        }
    }
    
    //MARK: - ENUM

}
