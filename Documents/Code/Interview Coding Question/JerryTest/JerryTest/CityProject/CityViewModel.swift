//
//  CityViewModel.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

protocol CityViewable {
    var cities: [City] {get}
    func getCites()
}

class CityViewModel: CityViewable {
    
    private var service: ServiceLayer

    var cities: [City] = []
    
    init(service: ServiceLayer) {
        self.service = service
    }
    
    convenience init() {
        self.init(service: ServiceLayerImp.shared)
    }
    
    func getCites() {
        service.getJSONCites { [weak self] (cities) in
            self?.cities = cities
        }
    }
}
