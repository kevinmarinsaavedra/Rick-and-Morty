//
//  LocationEndPoint.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import  Alamofire

enum LocationEndpoint {
    case fetchLocations(parameters: Parameters? = .none)
}

extension LocationEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .fetchLocations:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchLocations:
            return "\(RickAndMorty.BaseURL.URL)/location"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .fetchLocations(let parameters):
            return parameters
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchLocations:
            return nil
        }
    }
    
    var interceptor: RequestInterceptor? {
        switch self {
        case .fetchLocations:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchLocations:
            return URLEncoding.queryString
        }
    }
}
