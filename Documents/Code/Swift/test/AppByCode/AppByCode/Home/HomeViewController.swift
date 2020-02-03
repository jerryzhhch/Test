//
//  HomeViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [welcomeLabel])
        stackView.distribution = .fill
        return stackView
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Hogwarts"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationController?.navigationBar.isHidden = true
    }

    private func setupView() {
        let rootView = HomeView(frame: self.view.frame)
        self.view = rootView
        self.view.backgroundColor = .white

        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
}
