//
//  CityViewController.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    private var viewModel: CityViewable
    var rootView = CityView()
    
    init(viewModel: CityViewable) {
        self.viewModel = viewModel
        super.init(nibName:nil, bundle:nil)
    }
    
    convenience init() {
        self.init(viewModel: CityViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCites()
        bindView()
    }
    
    private func bindView() {
        self.view = rootView
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.configureView(title: viewModel.cities[indexPath.row].city, rank: viewModel.cities[indexPath.row].rank)
        return cell
    }
}

extension CityViewController: UITableViewDelegate {
    
}
