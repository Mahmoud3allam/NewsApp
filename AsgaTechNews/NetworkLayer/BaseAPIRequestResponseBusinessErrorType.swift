//
//  BaseAPIRequestResponseBusinessErrorType.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation

// Handling Buseiness Errors.
enum BaseAPIRequestResponseBusinessErrorType: Error {
    case providerError

    var message: String {
        switch self {
        case .providerError:
            return ""
        }
    }
}
