//
//  HomeView.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/7/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {

    lazy var container: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        return view
    }()

    lazy var testButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Go to next"
        button.tintColor = .darkGray
        button.frame.size = CGSize(width: 100, height: 60)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.bottom.top.trailing.leading.equalTo(0)
        }

        container.addSubview(testButton)
        testButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(50)
            make.centerX.equalTo(self.center.x)
        }
    }
}
