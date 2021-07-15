//
//  Int+BusinessErrorCode.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
extension Int {
    func getAPIRequestResponseBusinessError() -> BaseAPIRequestResponseBusinessErrorType {
        switch self {
        case 20017:
            return .providerError
        default:
            return .providerError
        }
    }
}
