//
//  SearchViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search book..."
        searchBar.setShowsCancelButton(true, animated: false)
        return searchBar
    }()

    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        tableView.rowHeight = 80
        return tableView
    }()

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()

        searchBar.delegate = self
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(MyTableCell.self, forCellReuseIdentifier: "MyTableCell")
    }

    func buildView() {
        self.view.addSubview(searchBar)
        self.view.addSubview(searchTableView)

        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(30)
//            make.height.equalTo(80)
        }

        searchTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp_bottomMargin)
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        print(text)
        // TODO - service call

    }
}

extension SearchViewController: UITableViewDelegate {
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! MyTableCell
        cell.bookTitle.text = "test book"
        return cell
    }
}

extension SearchViewController: Delegate {
    func updateView() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}

extension UIViewController {

}
