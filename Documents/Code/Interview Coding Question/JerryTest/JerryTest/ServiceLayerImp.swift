//
//  ServiceLayer.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation

typealias CityHandler = ([City]) -> Void
typealias CategoryHandler = ([CategoryInfo]) -> Void

protocol ServiceLayer {
    func getJSONCites(complete: @escaping CityHandler)
    func getJSONCategoriesCalled(complete: @escaping CategoryHandler)
}

final class ServiceLayerImp: ServiceLayer {
    
    static let shared = ServiceLayerImp()
    init() {}
    
    func getJSONCites(complete: @escaping CityHandler) {
        guard let filePath = Bundle.main.path(forResource: "cities", ofType: "json") else {return}
        let url = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode([City].self, from: data)
            complete(result)
            return
        } catch {
            complete([])
            return
        }
    }
    
    func getJSONCategoriesCalled(complete: @escaping CategoryHandler) {
        guard let filePath = Bundle.main.path(forResource: "movies", ofType: "json") else {return}
        let url = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(CategoryResponse.self, from: data)
            complete(result.Categories)
            return
        } catch {
            complete([])
            return
        }
      }
}
