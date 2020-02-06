//
//  FakeServiceLayerImp.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/6/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

final class FakeServiceLayerImp: ServiceLayer {
    static let shared = FakeServiceLayerImp()
    private init() {}
    
    let fakeCity1 = City(city: "", state: "", rank: "")
    let fakeCity2 = City(city: "", state: "", rank: "")
    let fakeCity3 = City(city: "", state: "", rank: "")
    
    let fakeCategory1 = CategoryInfo(title: "", movies: [])
    let fakeCategory2 = CategoryInfo(title: "", movies: [])
    let fakeCategory3 = CategoryInfo(title: "", movies: [])
    let fakeCategory4 = CategoryInfo(title: "", movies: [])

    func getJSONCites(complete: @escaping CityHandler) {
        let fakeCities = [fakeCity1, fakeCity2, fakeCity3]
        complete(fakeCities)
        return
    }
    
    func getJSONCategoriesCalled(complete: @escaping CategoryHandler) {
        let fakeCategories = [fakeCategory1, fakeCategory2, fakeCategory3, fakeCategory4]
        complete(fakeCategories)
    }
}
