//
//  LocationModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

enum Location {
    
    //FetchLocations
    enum FetchLocations {
        struct Request: Codable {
            var parameters: Parameters?
        }
        
        class Response: ResponseBase<[LocationModel]> {
            
        }
        
        struct ViewModel {
            let locations: [LocationModel]
        }
    }
    
    //FetchLocation
    enum FetchLocation {
        struct Request: Codable {
            var id: Int?
        }
        
        struct Response: Codable {
            
        }
        
        struct ViewModel {
            let location: LocationModel
        }
    }
    
    //MARK: - MODEL
    
    // MARK: - Parameters
    struct Parameters: Codable {
        let name: String?

        enum CodingKeys: String, CodingKey {
            case name = "name"
        }
    }

    // MARK: - LocationModel
    struct LocationModel: Codable {
        let id: Int
        let name: String
        let type: String
        let dimension: String
        let residents: [String]
        let url: String
        let created: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case type = "type"
            case dimension = "dimension"
            case residents = "residents"
            case url = "url"
            case created = "created"
        }
    }
    
    //MARK: - ENUM

}
