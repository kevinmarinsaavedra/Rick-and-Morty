//
//  LocationEndPoint.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import  Alamofire

enum LocationEndpoint {
    case fetchLocations(parameters: Parameters? = .none)
    case fetchLocation(id: Int)
}

extension LocationEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .fetchLocations, .fetchLocation:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchLocations:
            return "\(RickAndMorty.BaseURL.URL)/location"
        case .fetchLocation(let id):
            return "\(RickAndMorty.BaseURL.URL)/location/\(id)"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .fetchLocations(let parameters):
            return parameters
        case .fetchLocation:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchLocations, .fetchLocation:
            return nil
        }
    }
    
    var interceptor: RequestInterceptor? {
        switch self {
        case .fetchLocations, .fetchLocation:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchLocations:
            return URLEncoding.queryString
        case .fetchLocation:
            return JSONEncoding.default
        }
    }
}
