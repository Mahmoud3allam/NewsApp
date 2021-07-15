//
//  APIRequestExecuter.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Alamofire
import Foundation
class APIRequestExecuter<T: APIRequestBuilder> {
    // MARK: - Base API Function to Call Api..

    private lazy var alamofireSession: Session? = {
        let configuration = URLSessionConfiguration.default
        let apiRequestResponseLog = APIRequestResponseLog()
        let interceptor = APIRequestInterceptor()
        let alamoFireManager = Alamofire.Session(configuration: configuration, interceptor: interceptor, cachedResponseHandler: nil, eventMonitors: [apiRequestResponseLog])
        return alamoFireManager
    }()

    func performRequest<M: Decodable>(target: T, responseClass _: M.Type, completion: @escaping (Swift.Result<M?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let parameters = buildParameters(withTask: target.task)
        let headers = buildHeaders(withHeader: target.headers)
        alamofireSession?.request(target.baseUrl + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers ?? nil, interceptor: APIRequestInterceptor()).validate().responseJSON { response in
            guard response.response?.statusCode != nil else {
                // We Should add Custom Error here...
                completion(.failure(.server))
                return
            }
            switch response.result {
            case .success:
                guard let jsonData = response.data else {
                    // We Should add Custom Error that we can't get Json Data
                    completion(.failure(.parse))
                    return
                }
                do {
                    let responseObject = try JSONDecoder().decode(M.self, from: jsonData)
                    print("🕺 🕺 🕺 🕺 🕺🕺 💪")
                    completion(.success(responseObject))
                } catch {
                    print("😑 😑 😑 😑 😑 😑 😑 😑 😑 😑 😑 😑 😑 😑")
                    completion(.failure(.parse))
                    return
                }
            case let .failure(error):
                print("🚫 🚫 🚫 🚫 🚫 🚫 🚫 🚫 🚫 🚫 🚫 🚫")
                guard let error = error.underlyingError as NSError? else {
                    completion(.failure(BaseAPIRequestResponseFailureErrorType.unknown))
                    return
                }
                completion(.failure(error.code.getAPIRequestResponseFailureErorr()))
            }
        }
    }

    // MARK: - Build Parameters for  Requests

    private func buildParameters(withTask task: Task) -> ([String: Any]?, ParameterEncoding, [MultiPartData]?) {
        switch task {
        case .normalRequest:
            return (nil, URLEncoding.default, nil)
        case let .WithParametersRequest(parameters: parameters, encoding: encoding):
            return (parameters, encoding, nil)
        case let .multiPartRequest(parameters: params, multiPartData: data, encoding: encoding):
            return (params, encoding, data)
        }
    }

    private func buildHeaders(withHeader headers: [String: String]?) -> HTTPHeaders? {
        if let unwrappedHeaders = headers {
            return HTTPHeaders(unwrappedHeaders)
        }
        return nil
    }
}
