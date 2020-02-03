//
//  CharactersViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit
import RxSwift

class CharactersViewController: UIViewController {

    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search character ..."
        return searchController
    }()

    private let rootView = CharactersView()
    var searchActive: Bool = false
    private let viewModel: CharactersViewModel
    private let disposeBag = DisposeBag()

    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    convenience init() {
        self.init(viewModel: CharactersViewModel())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel.getCharacters()
        bindView()
    }

    private func configureView() {
        self.view = rootView
        rootView.tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
    }

    private func bindView() {
        viewModel.charRelay.bind(to: rootView.tableView.rx.items(cellIdentifier: "CharCell", cellType: CharCell.self)) { _, model, cell in
            cell.config(name: model.name)
        }.disposed(by: disposeBag)

        rootView.tableView.rx.modelSelected(Character.self)
            .subscribe(onNext: { [weak self] model in
                print(model.name!)
                // TODO: push detail page view controller
            }).disposed(by: disposeBag)
    }

}

extension CharactersViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchActive {
            // filter character
        } else {
            print("Search bar is not activated")
        }
    }
}
