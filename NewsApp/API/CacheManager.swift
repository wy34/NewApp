//
//  CacheManager.swift
//  NewsApp
//
//  Created by William Yeung on 6/10/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String: Data]()
    
    static func saveData(_ url: String, _ imageData: Data) {
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url: String) -> Data? {
        return imageDictionary[url]
    }
}
