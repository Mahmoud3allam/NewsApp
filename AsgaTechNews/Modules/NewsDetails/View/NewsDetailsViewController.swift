//
//  NewsDetailsViewController.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Kingfisher
import UIKit
class NewsDetailsViewController: UIViewController, NewsDetailsViewProtocol {
    var presenter: NewsDetailsPresenterProtocol!
    lazy var containerView: NewsDetailsContainerView = {
        var view = NewsDetailsContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }

    func updateUserInterFace(with article: Article) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.title = article.author ?? ""
            self.containerView.setupView(with: article)
        }
    }
}
