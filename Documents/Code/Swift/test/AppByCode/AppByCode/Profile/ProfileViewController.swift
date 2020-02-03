//
//  ProfileViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let rootView = ProfileView()

    private var catagories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        getMovies()
    }

    private func bindView() {
        self.view = rootView
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }

    private func getMovies() {
        guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else { return }

        let fileURL = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: fileURL)
            let result = try JSONDecoder().decode(Movies.self, from: data)
            catagories = result.Categories
        } catch {
            print("Error")
        }
    }

}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Category: ", catagories[indexPath.row].title)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatCell
        let catagory = catagories[indexPath.row].title
        let movies = catagories[indexPath.row].movies
        cell.configureView(catagory: catagory, movies: movies)
        return cell
    }

}
