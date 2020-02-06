//
//  CityCell.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/2/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class CityCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        return title
    }()
    
    lazy var rankLabel: UILabel = {
        let rank = UILabel()
        return rank
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(rankLabel)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
        }
        rankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureView(title: String, rank: String) {
        titleLabel.text = title
        rankLabel.text = rank
    }
}
