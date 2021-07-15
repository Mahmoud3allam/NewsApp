//
//  NewsSearchViewController + SearchBar.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

extension NewsSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let unwrappedKeyWord = searchBar.text {
            self.presenter.searchNews(with: unwrappedKeyWord)
        }
    }

    func searchBarBookmarkButtonClicked(_: UISearchBar) {
        // presenter.clearDataSourceOnCancel()
    }
}
