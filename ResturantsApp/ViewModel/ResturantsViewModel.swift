//
//  ResturantsViewModel.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 26/02/2023.
//

import Foundation

class ResturantsViewModel {
    
    private var updateHandler: (() -> Void)?
    private var errorHandler: ((Error) -> Void)?
    
    private var resturants: [Resturant] = [] {
        didSet {
            self.updateHandler?()
        }
    }
    
    private let service: NetworkService
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    func bind(updateHandler: @escaping () -> Void, errHandler: @escaping (Error) -> Void) {
        self.updateHandler = updateHandler
        self.errorHandler = errHandler
    }
    
    var count: Int {
        return resturants.count
    }
    
    func launchResturants() {
        self.service.fetchDecodableData(url: NetworkURLs.lunchData.url) { [weak self] (result: Result<ResturantWrapper, Error>) in
            switch result {
            case .success(let res):
                self?.resturants = res.restaurants
            case .failure(let err):
                self?.errorHandler?(err)
            }
        }
    }
    
    func allLatitudes() -> [Double] {
        var latitudes: [Double] = []
        return latitudes
    }
    
    func allLongitudes() -> [Double] {
        var longitudes: [Double] = []
        return longitudes
    }
    
    func resturantDetailViewModel(for index: Int) -> ResturantDetailViewModel? {
        guard index < self.resturants.count else { return nil }
        return ResturantDetailViewModel(resturant: self.resturants[index], service: self.service)
    }
}
