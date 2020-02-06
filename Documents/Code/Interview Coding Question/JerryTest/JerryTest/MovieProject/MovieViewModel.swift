//
//  MovieViewModel.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

protocol MovieViewable {
    var categories: [Category] { get }
    func getCategories()
}

class MovieViewModel: MovieViewable {
    
    private var service: ServiceLayer

    var categories: [Category] = []
    
    init(service: ServiceLayer) {
        self.service = service
    }
    
    convenience init() {
        self.init(service: ServiceLayerImp.shared)
    }
    
    func getCategories() {
        service.getJSONCategoriesCalled { [weak self] (categories) in
            self?.categories = categories
        }
    }
}
