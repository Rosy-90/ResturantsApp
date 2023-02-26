//
//  NetworkURLs.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 26/02/2023.
//

import Foundation

enum NetworkURLs: String {
     case webPage = "https://www.bottlerocketstudios.com"
     case lunchData = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}
