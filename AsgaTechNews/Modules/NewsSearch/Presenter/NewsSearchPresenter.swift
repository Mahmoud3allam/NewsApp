//
//  NewsSearchPresenter.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class NewsSearchPresenter: NewsSearchPresenterProtocol, NewsSearchInteractorOutPutProtocol {
    weak var view: NewsSearchViewProtocol?
    private let interactor: NewsSearchInteractorInPutProtocol
    private let router: NewsSearchRouterProtocol
    var newsPage: Int = 1
    var totalArticlesCount: Int = 0
    var isLoadedArticlesFirstTime: Bool = false
    var articles = [Article]()

    init(view: NewsSearchViewProtocol, interactor: NewsSearchInteractorInPutProtocol, router: NewsSearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func numberOfArticles() -> Int {
        self.articles.count == 0 ?
            self.view?.showTableViewPlaceHolder(with: "Please search to refresh content.") :
            self.view?.hideTableViewPlaceHolder()
        return self.articles.count
    }

    func configureTableView(with cell: ArticleCellView, indexPath: IndexPath) {
        guard self.articles.count - 1 >= indexPath.item else {
            return
        }
        cell.setData(article: self.articles[indexPath.item])
    }

    func searchNews(with keyWord: String) {
        self.interactor.searchNews(with: keyWord, page: self.newsPage, isPaginating: false)
    }

    func sucsessfullyFetchedNews(newsData: NewsEntity) {
        if let unwrappedArticles = newsData.articles, let totalItemsCount = newsData.totalResults {
            self.isLoadedArticlesFirstTime = true
            self.articles = unwrappedArticles
            self.totalArticlesCount = totalItemsCount
        }
        print(newsData)
        self.view?.dismissSearchController()
        self.view?.reloadTableView()
    }

    func sucsessfullyFetchedMoreNews(newsData: NewsEntity) {
        if let unwrappedArticles = newsData.articles, let totalItemsCount = newsData.totalResults {
            unwrappedArticles.forEach { self.articles.append($0) }
            self.totalArticlesCount = totalItemsCount
        }
        self.view?.reloadTableView()
    }

    func failedToFetchNews(with message: String) {
        print(message)
    }
}
