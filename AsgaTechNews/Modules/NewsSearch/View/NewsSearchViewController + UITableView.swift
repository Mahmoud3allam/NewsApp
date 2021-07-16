//
//  NewsSearchViewController + UITableView.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit
extension NewsSearchViewController {
    func registerTableViewCells() {
        self.tableView.separatorStyle = .none
        self.tableView.register(ArticleCell.self, forCellReuseIdentifier: NSStringFromClass(ArticleCell.self))
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        self.presenter.numberOfArticles()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ArticleCell.self), for: indexPath) as? ArticleCell else {
            return UITableViewCell()
        }
        self.presenter.configureTableView(with: cell, indexPath: indexPath)
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectTableView(at: indexPath)
    }

    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.presenter.willDisplayCell(with: indexPath, keyWord: self.searchController.searchBar.text ?? "")
        cell.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.alpha = 1
        }, completion: nil)
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
