//
//  MovieCell.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class MovieCell: UICollectionViewCell {
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.numberOfLines = 2
        return name
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        container.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.margins)
        }
    }
    
    func configure(name: String) {
        nameLabel.text = name
    }
}
