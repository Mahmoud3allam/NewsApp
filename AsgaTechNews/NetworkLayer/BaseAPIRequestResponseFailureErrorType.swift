//
//  BaseAPIRequestResponseFailureErrorType.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation

// Handling server Errors.
public enum BaseAPIRequestResponseFailureErrorType: Error {
    case informational
    case redirection
    case client
    case server
    case internet
    // Without Status Code
    case unknown
    case parse

    var message: String {
        switch self {
        case .informational:
            return "informational Error , Try Again in a few seconds"
        case .redirection:
            return "redirection Error , Try Again in a few seconds"
        case .client:
            return "client Error , Try Again in a few seconds"
        case .server:
            return "server Error , Try Again in a few seconds"
        case .unknown:
            return "Something went wrong please try again later."
        case .internet:
            return "internet Error , Try Again in a few seconds"
        case .parse:
            return "parse Error , Try Again in a few seconds"
        }
    }
}
