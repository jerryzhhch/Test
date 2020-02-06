//
//  MockCityViewModel.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

class MockCityViewModel: CityViewable {
    
    var cities: [City] = []
    
    func getCites() {
        let cityOne = City(city: "city1", state: "state1", rank: "1")
        let cityTwo = City(city: "city2", state: "state2", rank: "2")
        let cityThree = City(city: "city3", state: "state3", rank: "3")
        cities.append(cityOne)
        cities.append(cityTwo)
        cities.append(cityThree)
    }
}
