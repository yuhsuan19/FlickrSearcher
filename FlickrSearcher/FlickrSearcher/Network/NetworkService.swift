//
//  Service.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation

enum Encoding {
    case url
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkService {
    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var httpHeaders: [String: String]? { get }
    
    var parameters: [String: Any?]? { get }
    
    var encoding: Encoding? { get }
    
    var timeout: TimeInterval { get }
}

extension NetworkService {
    var request: URLRequest {
        var urlComponents = URLComponents()
        urlComponents.path = path
        
        if encoding == .url, let parameters = parameters {
            if urlComponents.queryItems == nil {
                urlComponents.queryItems = []
            }
            
            for parameter in parameters {
                if let value = parameter.value {
                    let item = URLQueryItem(name: parameter.key, value: String(describing: value))
                    urlComponents.queryItems?.append(item)
                } else {
                    let item = URLQueryItem(name: parameter.key, value: nil)
                    urlComponents.queryItems?.append(item)
                }
            }
        }
        
        let url = urlComponents.url(relativeTo: baseURL) ?? baseURL
        var request = URLRequest(url: url, timeoutInterval: timeout)
        request.httpMethod = method.rawValue
        
        return request
    }
}
