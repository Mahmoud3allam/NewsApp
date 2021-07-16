//
//  APIRequestBuilder.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - BluePrint For Every Request

protocol APIRequestBuilder {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

extension APIRequestBuilder {
    var baseUrl: String {
        NetworkConstant.baseUrl.rawValue
    }

    var headers: [String: String]? {
        switch task {
        case .normalRequest, .WithParametersRequest:
            return ["application/json": "Accept", "Content-Type": "application/json"]
        case .multiPartRequest:
            return ["application/json": "Accept"]
        }
    }
}

// Method
enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// Task
enum Task {
    case normalRequest
    case WithParametersRequest(parameters: [String: Any], encoding: ParameterEncoding)
    case multiPartRequest(parameters: [String: Any]?, multiPartData: [MultiPartData], encoding: ParameterEncoding)
}

// For Multi Part Requests..
struct MultiPartData {
    var dataKey: String
    var dataValue: Data
    var dataType: MultiPartDataType
    var dataExtension: MultiPartDataExtension
}

enum MultiPartDataType: String {
    case imagePng = "image/png"
    case imageJpeg = "image/jpeg"
    case videoMov = "video/mov"
}

enum MultiPartDataExtension: String {
    case png = ".png"
    case jpeg = ".jpeg"
    case mov = ".mov"
}
