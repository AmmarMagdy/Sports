//
//  Request.swift
//  Sports
//
//  Created by Ammar.M on 7/3/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Alamofire

class Request {
    
    static func requestAPI(router: Router, _ completionHandler: @escaping (Result<Data, Error>, Int?) -> Void) {
        AF.request(router).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data), response.response?.statusCode)
            case.failure(let error):
                completionHandler(.failure(error), response.response?.statusCode)
            }
        }
    }
}

