//
//  ResturantDetailViewModel.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 01/03/2023.
//

import Foundation

class ResturantDetailViewModel {
    
    private let resturant: Restaurant
    private let service: NetworkService
    
    init(resturant: Restaurant, service: NetworkService) {
        self.resturant = resturant
        self.service = service
    }
    
    var name: String {
        return self.resturant.name
    }
    
    var category: String {
        return self.resturant.category
    }
    
    func imageData(completion: @escaping (Data?) -> Void) {
        if let imageData = ImageCache.shared.getImageData(for: self.resturant.backgroundImageURL) {
            completion(imageData)
            return
        }
        self.service.fetchRawData(url: URL(string: self.resturant.backgroundImageURL)) { [weak self] (result) in
            switch result {
            case .success(let data):
                ImageCache.shared.setImageData(for: self?.resturant.backgroundImageURL, imageData: data)
                completion(data)
            case .failure(let err):
                print(err)
                completion(nil)
            }
        }
    }
}
