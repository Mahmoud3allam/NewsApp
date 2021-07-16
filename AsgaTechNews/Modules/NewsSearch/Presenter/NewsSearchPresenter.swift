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

    // MARK: = TableView

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

    func didSelectTableView(at IndexPath: IndexPath) {
        guard self.articles.count - 1 >= IndexPath.item else {
            return
        }
        self.router.navigateToNewsDetailsScene(with: self.articles[IndexPath.item])
    }

    func willDisplayCell(with Index: IndexPath, keyWord: String) {
        if Index.item == self.articles.count - 1 {
            if self.isLoadedArticlesFirstTime, canLoadMore() {
                self.newsPage += 1
                // Add Pagination Indicator
                self.view?.addPaginationIndicator()
                let keyWorkWithOutSpaces = keyWord.replacingOccurrences(of: " ", with: "")
                self.interactor.searchNews(with: keyWorkWithOutSpaces, page: self.newsPage, isPaginating: true)
            }
        }
    }

    private func canLoadMore() -> Bool {
        if self.totalArticlesCount > self.articles.count {
            return true
        }
        self.view?.removePaginationIndicator()
        return false
    }

    func searchNews(with keyWord: String) {
        let keyWorkWithOutSpaces = keyWord.replacingOccurrences(of: " ", with: "")
        self.newsPage = 1
        self.view?.showActivityIndicator()
        self.interactor.searchNews(with: keyWorkWithOutSpaces, page: self.newsPage, isPaginating: false)
    }

    // MARK: = Interactor Call Backs

    func sucsessfullyFetchedNews(newsData: NewsEntity) {
        if let unwrappedArticles = newsData.articles, let totalItemsCount = newsData.totalResults {
            self.isLoadedArticlesFirstTime = true
            self.articles = unwrappedArticles
            self.totalArticlesCount = totalItemsCount
        }
        self.view?.dismissSearchController()
        self.view?.reloadTableView()
        if articles.count > 0 {
            view?.scrollToFirstIndex()
        }
        view?.hideActivityIndicator()
    }

    func sucsessfullyFetchedMoreNews(newsData: NewsEntity) {
        if let unwrappedArticles = newsData.articles, let totalItemsCount = newsData.totalResults {
            unwrappedArticles.forEach { self.articles.append($0) }
            self.totalArticlesCount = totalItemsCount
        }
        self.view?.removePaginationIndicator()
        self.view?.reloadTableView()
    }

    func failedToFetchNews(with message: String) {
        self.view?.dismissSearchController()
        self.view?.hideActivityIndicator()
        self.view?.removePaginationIndicator()
        self.view?.showError(with: message)
    }
}
