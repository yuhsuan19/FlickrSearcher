//
//  ServiceProvider.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation
import Alamofire

enum Result {
    case success(Any)
    case failure(Error)
}

struct Response {
    var statusCode: Int {
        return response.statusCode
    }
    var data: Data
    var request: URLRequest
    var response: HTTPURLResponse
}

class NetworkServiceProvider {
    typealias ProviderCompletion = (Result) -> Void
    
    func request(for service: NetworkService, completion: @escaping ProviderCompletion) {
        let request = service.request
        
        Alamofire.request(request).responseData() { (dataResponse) in
            guard let response = dataResponse.response else {
                // completion(.failure(AppError.networkFailed))
                return
            }
            
            switch dataResponse.result {
            case .success(let data):
                let response = Response(data: data, request: request, response: response)
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
