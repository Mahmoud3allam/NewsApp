//
//  NewsSearchViewController.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class NewsSearchViewController: UITableViewController, NewsSearchViewProtocol {
    var presenter: NewsSearchPresenterProtocol!
    lazy var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.setupSearchController()
        self.setupUiBehaviors()
        self.setupNavigationBarBehaviors()
        self.registerTableViewCells()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
    }

    override func viewWillAppear(_: Bool) {
        self.setupNavigationBarBehaviors()
    }

    override func viewWillDisappear(_: Bool) {
        self.title = " "
    }

    private func setupUiBehaviors() {
        self.view.backgroundColor = ColorType.background.value
    }

    private func setupNavigationBarBehaviors() {
        self.title = "Search"
    }

    private func setupSearchController() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.searchTextField.textColor = ColorType.mainTextColor.value
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
        }
    }

    func scrollToFirstIndex() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 0, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

    func dismissSearchController() {
        self.searchController.dismiss(animated: true, completion: nil)
    }

    func showTableViewPlaceHolder(with title: String) {
        let placeHolder = TableViewPlaceHolderView(placeHolderImage: #imageLiteral(resourceName: "information2"), subTitle: title)
        placeHolder.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 120)
        self.tableView.backgroundView = placeHolder
    }

    func hideTableViewPlaceHolder() {
        self.tableView.backgroundView = nil
    }
}
