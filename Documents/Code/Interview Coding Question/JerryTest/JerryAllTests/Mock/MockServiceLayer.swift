//
//  MockServiceLayer.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//


class MockServiceLayer: ServiceLayer {
    
    static let shared = MockServiceLayer()
    init() {}
    
    var isGetJSONCitiesCalled: Bool = false
    var isGetJSONCategoriesCalled: Bool = false
    
    func getJSONCites(complete: @escaping CityHandler) {
        isGetJSONCitiesCalled = true
        complete([])
        return
    }
    
    func getJSONCategoriesCalled(complete: @escaping CategoryHandler) {
        isGetJSONCategoriesCalled = true
    }
    
}
