//
//  NewsSearchRouter.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class NewsSearchRouter: NewsSearchRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule() -> UIViewController {
        let interactor = NewsSearchInteractor()
        let router = NewsSearchRouter()
        let view = NewsSearchViewController()
        let presenter = NewsSearchPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToNewsDetailsScene(with article: Article) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let newsDetailsScene = NewsDetailsRouter.createAnModule(article: article)
            self.viewController?.navigationController?.pushViewController(newsDetailsScene, animated: true)
        }
    }
}
