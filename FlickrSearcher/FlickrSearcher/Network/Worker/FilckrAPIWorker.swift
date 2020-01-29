//
//  FilckrAPIWorker.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation
import SwiftyJSON

class FlickrAPIWorker {
    typealias WorkerCompletion = (NetworkResult<Any?>) -> Void
    var provider = NetworkServiceProvider()
    
    func search(with keyword: String, perpageCount: Int, page: Int, completion: @escaping WorkerCompletion) {
        provider.request(for: FlickrAPI.search(keyword: keyword, perPageCount: perpageCount, page: page)) {[weak self] (result) in
            switch result {
            case .success(let response):
                let paresdDic = self?.parseSearchResponseData(response.data)
                completion(.success(paresdDic))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension FlickrAPIWorker {
    private func parseSearchResponseData(_ data: Data) -> [String: Any]? {
        guard let json = try? JSON(data: data), json["stat"].stringValue == "ok" else {
            return nil
        }
        let response = json["photos"].dictionaryValue
        guard let pages = response["pages"]?.intValue,
              let page = response["page"]?.intValue,
              let photos = response["photo"]?.arrayValue else {
            return nil
        }
        
        return ["page": page,
                "pages": pages,
                "photos": photos]
    }
}
