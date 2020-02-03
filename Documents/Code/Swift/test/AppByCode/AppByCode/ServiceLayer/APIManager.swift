//
//  APIManager.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/21/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation

typealias CharacterHandler = ([Character]) -> Void

protocol APIServiceLayer {
    func getCharacters(completion: @escaping CharacterHandler)
    func getMockCharacters(completion: @escaping CharacterHandler)
}

final class APIManager: APIServiceLayer {
    static let shared = APIManager()

    private init() {}

    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }()

    func getCharacters(completion: @escaping CharacterHandler) {
        let urlString = APIQuery.getCharactersString()
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        session.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                completion([])
                print(error)
                return
            }

            if let data = dat {
                do {
                    let response = try JSONDecoder().decode([Character].self, from: data)
                    completion(response)
                } catch {
                    print(">>>> Cannot serialize data")
                    completion([])
                    return
                }

            }
        }.resume()
    }

    func getMockCharacters(completion: @escaping CharacterHandler) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let path = Bundle.main.path(forResource: "mockCharacters", ofType: "json") else {
                completion([])
                return
            }

            let fileURL = URL(fileURLWithPath: path)

            var characters = [Character]()

            do {
                let data = try Data(contentsOf: fileURL)

                guard let response = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                    print("Bad JSON format")
                    completion([])
                    return
                }

                for dict in response {
                    let char = Character(mockDict: dict)
                    characters.append(char)
                }

                DispatchQueue.main.async {
                    completion(characters)
                    return
                }
            } catch {
                completion([])
                return
            }
        }
    }

    func getCharactersRX() {

    }

}
