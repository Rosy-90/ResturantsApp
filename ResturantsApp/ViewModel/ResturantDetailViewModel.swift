//
//  ResturantDetailViewModel.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 01/03/2023.
//

import Foundation

class ResturantDetailViewModel {
    
    private let resturant: Resturant
    private let service: NetworkService
    
    init(resturant: Resturant, service: NetworkService) {
        self.resturant = resturant
        self.service = service
    }
    
    var name: String {
        return self.resturant.name
    }
    
    var category: String {
        return self.resturant.category
    }
}
