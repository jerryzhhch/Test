//
//  CategoryView.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class CategoryView: UIView {
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        table.rowHeight = 160
        return table
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
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
