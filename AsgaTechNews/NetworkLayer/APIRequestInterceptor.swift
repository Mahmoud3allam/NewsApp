//
//  APIRequestInterceptor.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Alamofire
import Foundation

final class APIRequestInterceptor: RequestInterceptor {
    private let retryLimit = 1
    private let retryDelay: TimeInterval = 3

    func retry(_ request: Request, for _: Session, dueTo _: Error, completion: @escaping (RetryResult) -> Void) {
        // Retry Logic.. , and refreshing token if there..
        guard (request.task?.response as? HTTPURLResponse) != nil else {
            return completion(.doNotRetry)
        }
        if request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
            return completion(.doNotRetry)
        }
    }
}
