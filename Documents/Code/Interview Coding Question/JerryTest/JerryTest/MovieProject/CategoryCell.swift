//
//  CategoryCell.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit
import SnapKit

class CategoryCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(collectionView)
        return stackView
    }()
    
    private var movies: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
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
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(30)
        }
    }
    
    func configure(title: String, movies: [String]?) {
        titleLabel.text = title
        if let movies = movies {
            self.movies = movies
        }
    }
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(name: movies[indexPath.row])
        return cell
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
}
