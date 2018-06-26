//
//  RequestFactory.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

final class RequestFactory {
    
    enum Method: String {
        case GET
        case POST
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
