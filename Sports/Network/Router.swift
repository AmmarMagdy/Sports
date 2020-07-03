//
//  Router.swift
//  Sports
//
//  Created by Ammar.M on 7/3/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURL = "https://www.thesportsdb.com/"
    
    case getLeagues
    case getLeaguesDetails(id: String)
    
    
    var url: URL {
        switch self {
        case .getLeagues:
            return URL(string: Router.baseURL + "api/v1/json/1/all_leagues.php")!
        case .getLeaguesDetails:
            return URL(string: Router.baseURL + "api/v1/json/1/lookupleague.php")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLeagues, .getLeaguesDetails:
            return .get
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getLeaguesDetails(let id):
            return ["id": id ]
        case .getLeagues:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameter)
    }
    
}
