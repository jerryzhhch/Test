//
//  CacheManager.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

typealias ImageHandeler = (UIImage) -> Void

final class CacheManager {
    static let shared = CacheManager()
    private init() {}

    private let defaultImage = UIImage(named: "defaultImage")!
    private let cache = NSCache<NSString, UIImage>()

    func downloadImage(imageUrlString: String, completion: @escaping ImageHandeler) {
        /*
         we save the image to cache so that same images don't need to be downloaded every time when users call a search request to API
         */
        // get image if this imgae is already in cache
        if let cachedImage = cache.object(forKey: imageUrlString as NSString) {
            completion(cachedImage)
            return
        }

        // cache first
        if imageUrlString == "defaultImage" {
            completion(self.defaultImage)
            return
        } else {
            // to cache: 1. construct URL from String
            guard let url = URL(string: imageUrlString) else {
                completion(self.defaultImage)
                return
            }

            // 2. create a API request
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let myError = error {
                    print("Couldn't Retrieve Data: ", myError.localizedDescription)
                    completion(self.defaultImage)
                    return
                }
                // get the image from data
                if let myData = data {
                    guard let myImage = UIImage(data: myData) else {
                        print("Cannot cache the image.")
                        completion(self.defaultImage)
                        return
                    }
                    // save image to cache
                    self.cache.setObject(myImage, forKey: imageUrlString as NSString)

                    // go to Main Thread to pass the completion
                    DispatchQueue.main.async {
                        completion(myImage)
                    }
                }
            }.resume()
        }
    }
}
