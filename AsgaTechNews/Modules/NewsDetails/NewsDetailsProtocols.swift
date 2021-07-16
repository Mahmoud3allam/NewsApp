//
//  NewsDetailsProtocols.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol NewsDetailsViewProtocol: AnyObject {
    var presenter: NewsDetailsPresenterProtocol! { get set }
    func updateUserInterFace(with article: Article)
}

protocol NewsDetailsPresenterProtocol {
    var view: NewsDetailsViewProtocol? { get set }

    func viewDidLoad()
}

protocol NewsDetailsRouterProtocol {}

protocol NewsDetailsInteractorInPutProtocol {
    var presenter: NewsDetailsInteractorOutPutProtocol? { get set }
}

protocol NewsDetailsInteractorOutPutProtocol: AnyObject {}
