//
//  MyTableCell.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class MyTableCell: UITableViewCell {

    lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.backgroundColor = UIColor.green
        return stackView
    }()

    lazy var bookTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.darkGray
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textAlignment = .left
        title.backgroundColor = UIColor.red
        return title
    }()

    lazy var bookImage: UIImageView = {
        let img = UIImageView(image: UIImage())

        return img
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildView() {
        self.contentView.addSubview(containerView)

        containerView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(10)
            make.leading.trailing.equalTo(10)
        }

        containerView.addArrangedSubview(bookTitle)
        bookTitle.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalToSuperview()
        }
    }
}
