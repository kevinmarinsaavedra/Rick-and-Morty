//
//  ServiceModel.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import Foundation

// MARK: - RequestBase
class RequestBase: Codable {
    //TODO: Create implementation if required
}

// MARK: - ResponseBase
class ResponseBase<T: Codable>: Codable {
    let info: InfoModel?
    let results: T?
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
}

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
