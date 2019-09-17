//
//  APIService.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation

let apiService = APIService.shared

typealias BookHandler = ([Book]?) -> Void

final class APIService {
    static let shared = APIService()
    private init() {}

    lazy var session: URLSession = {
        let configure = URLSessionConfiguration.default
        configure.timeoutIntervalForRequest = 30
        return URLSession(configuration: configure)
    }()

    func getBooks(_ query: String, completion: @escaping BookHandler) {
        let urlString = APICalls.getURL(query)

        guard let finalURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        guard let url = URL(string: finalURL) else {
            return
        }

        session.dataTask(with: url) { (data, _, error) in
            if let myError = error {
                print("Error in URLSession: \(myError.localizedDescription)")
                completion(nil)
                return
            }

            if let myData = data {
                do {
                    let bookInfo = try JSONDecoder().decode(BookInfo.self, from: myData)
                    completion(bookInfo.items)
                } catch {
                    print("No data from API calls")
                    completion(nil)
                }
            }
        }.resume()

    }

}
