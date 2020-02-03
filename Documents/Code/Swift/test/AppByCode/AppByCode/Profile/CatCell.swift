//
//  CatCell.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/24/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CatCell: UITableViewCell {

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(catLabel)
        stackView.addArrangedSubview(collectionView)
        stackView.alignment = .leading
        stackView.axis = .vertical
        catLabel.contentHuggingPriority(for: .vertical)
        return stackView
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MoviewCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    lazy var catLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private var movies = [String]()

    func configureView(catagory: String, movies: [String]?) {
        self.addSubview(stackView)

        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        catLabel.snp.makeConstraints { (make) in            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }

        collectionView.dataSource = self
        collectionView.delegate = self

        catLabel.text = catagory
        guard let movieArray = movies else {return}
        self.movies = movieArray
    }
}

extension CatCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MoviewCell
        let movie = movies[indexPath.row]
        cell.setupView(movie: movie)

        return cell
    }
}

extension CatCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
