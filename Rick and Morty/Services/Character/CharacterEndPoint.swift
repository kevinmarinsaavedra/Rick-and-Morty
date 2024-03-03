//
//  CharacterEndPoint.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import  Alamofire

enum CharacterEndpoint {
    case fetchCharacters(parameters: Parameters? = .none)
}

extension CharacterEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .fetchCharacters:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchCharacters:
            return "\(RickAndMorty.BaseURL.URL)/character"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .fetchCharacters(let parameters):
            return parameters
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchCharacters:
            return nil
        }
    }
    
    var interceptor: RequestInterceptor? {
        switch self {
        case .fetchCharacters:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchCharacters:
            return URLEncoding.queryString
        }
    }
}
