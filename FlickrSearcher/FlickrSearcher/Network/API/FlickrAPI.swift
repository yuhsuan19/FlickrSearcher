//
//  FlickrAPI.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation

enum FlickrAPI {
    case search(keyword: String ,perPageCount: Int = 100, page: Int = 0)
}

extension FlickrAPI: NetworkService {
    var baseURL: URL {
        return URL(string: "https://api.flickr.com/services/rest/")!
    }
    
    var path: String {
        switch self {
        case .search:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var httpHeaders: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any?]? {
        switch self {
        case .search(let keyword, let perPageCount, let page):
            return [
                "method": "flickr.photos.search",
                "api_key": "0c4e0ed79ca5b9282fe71210ee956399",
                "text": keyword,
                "per_page": perPageCount,
                "page": page,
                "format": "json",
                "nojsoncallback": 1
            ]
        }
    }
    
    var encoding: Encoding? {
        return .url
    }
    
    var timeout: TimeInterval {
        return 30
    }
}
