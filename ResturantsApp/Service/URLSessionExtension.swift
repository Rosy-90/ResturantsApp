//
//  URLSessionExtension.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 26/02/2023.
//

import Foundation

protocol Session {
    func getData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    func getData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
}
