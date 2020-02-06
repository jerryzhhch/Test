//
//  MovieViewController.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    private var viewModel: MovieViewable
    var rootView = CategoryView()
    
    init(viewModel: MovieViewable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(viewModel: MovieViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCategories()
        bindView()
    }
    
    private func bindView() {
        self.view = rootView
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(title: viewModel.categories[indexPath.row].title,
                       movies: viewModel.categories[indexPath.row].movies)
        return cell
    }
    
    
}

extension MovieViewController: UITableViewDelegate {
    
}
