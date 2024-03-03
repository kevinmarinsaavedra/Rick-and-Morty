//
//  ErrorService.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import Foundation

enum ErrorService: Error, CustomStringConvertible {
    case network(Error)
    case parse(Error)
    case unspecified
    case parameters
    
    var description: String {
        switch self {
        case .network(let error):
            return error.localizedDescription
        case .parse(let error):
            return error.localizedDescription
        case .unspecified:
            return "Unexpected error"
        case .parameters:
            return "Error encoding parameters"
        }
    }
}
