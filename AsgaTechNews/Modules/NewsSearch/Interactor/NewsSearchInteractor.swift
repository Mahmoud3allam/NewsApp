//
//  NewsSearchInteractor.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
class NewsSearchInteractor: NewsSearchInteractorInPutProtocol {
    weak var presenter: NewsSearchInteractorOutPutProtocol?
    private let newsWorker: NewsWorkerProtocol = NewsWorker()

    func searchNews(with keyWord: String, page: Int, isPaginating: Bool) {
        newsWorker.search(keyWord: keyWord, page: page) { results in
            switch results {
            case let .success(NewsEntity):
                if let unwrappedNewsEntity = NewsEntity {
                    if isPaginating {
                        self.presenter?.sucsessfullyFetchedMoreNews(newsData: unwrappedNewsEntity)
                    } else {
                        self.presenter?.sucsessfullyFetchedNews(newsData: unwrappedNewsEntity)
                    }
                } else {
                    self.presenter?.failedToFetchNews(with: BaseAPIRequestResponseFailureErrorType.parse.message)
                }
            case let .failure(error):
                self.presenter?.failedToFetchNews(with: error.message)
            }
        }
    }
}
