//
//  ProfileView.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/7/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CatCell.self, forCellReuseIdentifier: "CatCell")
        tableView.rowHeight = 200
        tableView.separatorColor = .black
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()

    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
