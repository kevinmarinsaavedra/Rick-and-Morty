//
//  Details.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

enum DetailsModel {

    //FetchDetails
    enum FetchDetails {
        struct Request: Codable {
            
        }
        
        struct Response: Codable {
            
        }
        
        struct ViewModel {
            let title: String
            let subtitle: String
            let description: String
        }
    }
}
