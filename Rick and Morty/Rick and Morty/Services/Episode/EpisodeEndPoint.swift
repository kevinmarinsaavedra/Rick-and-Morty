//
//  EpisodeEndPoint.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import  Alamofire

enum EpisodeEndpoint {
    case fetchEpisodes(parameters: Parameters? = .none)
}

extension EpisodeEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .fetchEpisodes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchEpisodes:
            return "\(RickAndMorty.BaseURL.URL)/episode"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .fetchEpisodes(let parameters):
            return parameters
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchEpisodes:
            return nil
        }
    }
    
    var interceptor: RequestInterceptor? {
        switch self {
        case .fetchEpisodes:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchEpisodes:
            return URLEncoding.queryString
        }
    }
}
