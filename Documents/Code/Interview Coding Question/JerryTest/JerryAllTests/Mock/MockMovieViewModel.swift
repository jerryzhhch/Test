//
//  MockMovieViewModel.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

class MockMovieViewModel: MovieViewable {
    var categories: [Category] = []
    
    func getCategories() {
        let categoryOne = Category(title: "title1", movies: ["movie1", "movie11", "movie111", "movie1111"])
        let categoryTwo = Category(title: "title2", movies: ["movie2", "movie22", "movie222", "movie2222"])
        let categoryThree = Category(title: "title3", movies: ["movie3", "movie33", "movie333", "movie3333"])
        let categoryFour = Category(title: "title4", movies: ["movie4", "movie44", "movie444", "movie4444"])

        categories.append(categoryOne)
        categories.append(categoryTwo)
        categories.append(categoryThree)
        categories.append(categoryFour)
    }
}
