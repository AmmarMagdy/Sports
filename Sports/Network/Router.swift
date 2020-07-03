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
    
    var url: URL {
        switch self {
        case .getLeagues:
            return URL(string: Router.baseURL + "api/v1/json/1/all_leagues.php")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLeagues:
            return .get
        }
    }
    
    var header: HTTPHeaders {
        return [:]
    }
    
    var parameter: Parameters? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = header
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameter)
    }
    
}
