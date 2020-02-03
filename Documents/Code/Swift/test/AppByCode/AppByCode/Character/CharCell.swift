//
//  CharCell.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/22/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class CharCell: UITableViewCell {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(name: String?) {
        nameLabel.text = name
        charImageView.image = UIImage(named: "Characters/charCellImage")
    }

    private func configureView() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.addArrangedSubview(charImageView)
        stackView.addArrangedSubview(nameLabel)
        charImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(stackView.snp.centerY)
            make.width.equalTo(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(charImageView).offset(40)
            make.centerY.equalTo(stackView.snp.centerY)
            make.height.equalTo(30)
        }
    }
}
