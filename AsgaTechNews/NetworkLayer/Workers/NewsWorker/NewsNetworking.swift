//
//  NewsNetworking.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Alamofire
import Foundation

enum NewsNetworking {
    case search(keyWork: String, page: Int)
}

extension NewsNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case let .search(keyWork, page):
            return "everything?q=\(keyWork)&apiKey=\(NetworkConstant.apiKey.rawValue)&page=\(page)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .search:
            return .normalRequest
        }
    }
}
