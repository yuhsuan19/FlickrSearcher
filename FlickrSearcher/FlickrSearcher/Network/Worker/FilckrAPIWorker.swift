//
//  FilckrAPIWorker.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation

class FlickrAPIWorker {
    typealias WorkerCompletion = (Result) -> Void
    var provider = NetworkServiceProvider()
    
    func search(with keyword: String, perpageCount: Int, page: Int, completion: @escaping WorkerCompletion) {
        provider.request(for: FlickrAPI.search(keyword: keyword, perPageCount: perpageCount, page: page)) { (result) in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
