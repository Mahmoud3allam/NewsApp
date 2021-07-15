//
//  NewsWorker.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Alamofire
import Foundation

protocol NewsWorkerProtocol {
    func search(keyWord: String, page: Int, completion: @escaping (Swift.Result<NewsEntity?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class NewsWorker: APIRequestExecuter<NewsNetworking>, NewsWorkerProtocol {
    func search(keyWord: String, page: Int, completion: @escaping (Result<NewsEntity?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .search(keyWork: keyWord, page: page), responseClass: NewsEntity.self) { results in
            completion(results)
        }
    }
}
