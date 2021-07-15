//
//  NewsDetailsPresenter.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class NewsDetailsPresenter: NewsDetailsPresenterProtocol, NewsDetailsInteractorOutPutProtocol {
    weak var view: NewsDetailsViewProtocol?
    private let interactor: NewsDetailsInteractorInPutProtocol
    private let router: NewsDetailsRouterProtocol

    init(view: NewsDetailsViewProtocol, interactor: NewsDetailsInteractorInPutProtocol, router: NewsDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }
}
