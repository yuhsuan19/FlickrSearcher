//
//  AppErro.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation

enum AppError: Error {
    case networkFailed
    
    var localizedDescription: String {
        switch self {
        case .networkFailed:
            return "讀取失敗！"
        }
    }
}
