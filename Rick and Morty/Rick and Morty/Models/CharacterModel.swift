//
//  CharacterModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import Foundation
import UIKit

enum Character {

    //FetchCharacters
    enum FetchCharacters {
        struct Request: Codable {
            
        }
        
        struct Response: Codable {
            let info: InfoModel?
            let results: [CharacterModel]?

            enum CodingKeys: String, CodingKey {
                case info = "info"
                case results = "results"
            }
        }
        
        struct ViewModel {
            let characters: [CharacterModel]
        }
    }
    
    //MARK: - MODEL
    
    // MARK: - Info
    struct InfoModel: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?

        enum CodingKeys: String, CodingKey {
            case count = "count"
            case pages = "pages"
            case next = "next"
            case prev = "prev"
        }
    }

    // MARK: - Result
    struct CharacterModel: Codable {
        //let id: Int?
        let name: String?
        let status: CharacterStatus?
        let species: String?
        /*/let type: String?
        let gender: String?
        let origin: LocationModel?
        let location: LocationModel?*/
        let image: String?
        /*let episode: [String]?
        let url: String?
        let created: String?*/

        enum CodingKeys: String, CodingKey {
            //case id = "id"
            case name = "name"
            case status = "status"
            case species = "species"
            /*case type = "type"
            case gender = "gender"
            case origin = "origin"
            case location = "location"*/
            case image = "image"
            /*case episode = "episode"
            case url = "url"
            case created = "created"*/
        }
    }

    // MARK: - Location
    struct LocationModel: Codable {
        let name: String?
        let url: String?

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case url = "url"
        }
    }
    
    //MARK: - ENUM
    enum CharacterStatus: String, Codable {
        case alive = "alive"
        case dead = "dead"
        case unknown = "unknow"
        
        func getColor() -> UIColor {
            switch self {
            case .alive:
                return RickAndMortyColor.alive ?? .clear
            case .dead:
                return RickAndMortyColor.dead ?? .clear
            case .unknown:
                return RickAndMortyColor.unknow ?? .clear
            }
        }
    }
}
