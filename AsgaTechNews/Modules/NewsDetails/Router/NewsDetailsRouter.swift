//
//  NewsDetailsRouter.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class NewsDetailsRouter: NewsDetailsRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule(article: Article) -> UIViewController {
        let interactor = NewsDetailsInteractor()
        let router = NewsDetailsRouter()
        let view = NewsDetailsViewController()
        let presenter = NewsDetailsPresenter(view: view, interactor: interactor, router: router, article: article)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
