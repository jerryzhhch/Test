//
//  CityView.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/2/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class CityView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
        tableView.rowHeight = 100
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
