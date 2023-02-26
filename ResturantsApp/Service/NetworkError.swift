//
//  NetworkError.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 26/02/2023.
//

import Foundation

enum NetworkError: Error, Equatable {
    case badURL
    case badData
    case decodeFailure
    case badStatusCode(Int)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Bad URL, could not convert string to URL", comment: "Bad URL")
        case .badData:
            return NSLocalizedString("Bad data, the data was corrupted or incorrect", comment: "Bad data")
        case .decodeFailure:
            return NSLocalizedString("Decoding failure, the data could not be decoded to the model", comment: "Decode Failure")
        case .badStatusCode(let code):
            return NSLocalizedString("The network connection was improper. Received Status code \(code)", comment: "Bad Status Code")
        }
    }
}
