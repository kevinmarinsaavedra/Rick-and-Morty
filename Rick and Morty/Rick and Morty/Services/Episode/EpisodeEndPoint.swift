//
//  EpisodeEndPoint.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import  Alamofire

enum EpisodeEndpoint {
    case fetchEpisodes(parameters: Parameters? = .none)
    case fetchEpisode(id: Int)

}

extension EpisodeEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .fetchEpisodes,.fetchEpisode:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchEpisodes:
            return "\(RickAndMorty.BaseURL.URL)/episode"
        case .fetchEpisode(let id):
            return "\(RickAndMorty.BaseURL.URL)/episode/\(id)"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .fetchEpisodes(let parameters):
            return parameters
        case .fetchEpisode:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchEpisodes, .fetchEpisode:
            return nil
        }
    }
    
    var interceptor: RequestInterceptor? {
        switch self {
        case .fetchEpisodes, .fetchEpisode:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchEpisodes:
            return URLEncoding.queryString
        case .fetchEpisode:
            return JSONEncoding.default
        }
    }
}
