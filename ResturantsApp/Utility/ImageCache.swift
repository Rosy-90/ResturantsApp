//
//  ImageCache.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 01/03/2023.
//

import Foundation

class ImageCache {
    
    static let shared = ImageCache()
    private let cache: NSCache<NSString, NSData>
    
    private init(cache: NSCache<NSString, NSData> = NSCache<NSString, NSData>()) {
        self.cache = cache
    }
}

extension ImageCache {
    func getImageData(for urlKey: String) -> Data? {
        let key = NSString(string: urlKey)
        return self.cache.object(forKey: key) as Data?
    }
    
    func setImageData(for urlKey: String?, imageData: Data) {
        guard let urlKey = urlKey else { return }
        let key = NSString(string: urlKey)
        let data = NSData(data: imageData)
        self.cache.setObject(data, forKey: key)
    }
}
