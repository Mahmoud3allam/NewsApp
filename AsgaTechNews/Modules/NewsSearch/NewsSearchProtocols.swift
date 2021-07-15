//
//  NewsSearchProtocols.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol NewsSearchViewProtocol: AnyObject {
    var presenter: NewsSearchPresenterProtocol! { get set }

    func reloadTableView()
    func scrollToFirstIndex()
    func dismissSearchController()
    func showTableViewPlaceHolder(with title: String)
    func hideTableViewPlaceHolder()
}

protocol NewsSearchPresenterProtocol {
    var view: NewsSearchViewProtocol? { get set }

    func viewDidLoad()
    func searchNews(with keyWord: String)
    func numberOfArticles() -> Int
    func configureTableView(with cell: ArticleCellView, indexPath: IndexPath)
}

protocol NewsSearchRouterProtocol {}

protocol NewsSearchInteractorInPutProtocol {
    var presenter: NewsSearchInteractorOutPutProtocol? { get set }

    func searchNews(with keyWord: String, page: Int, isPaginating: Bool)
}

protocol NewsSearchInteractorOutPutProtocol: AnyObject {
    func sucsessfullyFetchedNews(newsData: NewsEntity)
    func sucsessfullyFetchedMoreNews(newsData: NewsEntity)
    func failedToFetchNews(with message: String)
}

protocol ArticleCellView {
    func setData(article: Article)
}
