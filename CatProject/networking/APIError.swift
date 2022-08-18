//
//  APIError.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError)
    case parsing
    case unknown
    
    var localizedDescription: String {
        // feedback for user
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong"
        case .badResponse(_):
            return "Sorry, the connection to server failed."
        case .url(let error):
            return error.localizedDescription ?? "Something went wrong"
        }
    }
    
    var description: String {
        // debug info
        ""
    }
}
