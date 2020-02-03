//
//  MoviewCell.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/24/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class MoviewCell: UICollectionViewCell {

    lazy var baseView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1

        return view
    }()

    lazy var movieName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    func setupView(movie: String) {
        self.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        baseView.addSubview(movieName)
        movieName.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(10)
            make.bottom.trailing.equalToSuperview().inset(10)
        }
        movieName.text = movie
    }
}
