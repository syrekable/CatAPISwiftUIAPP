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
    case parsing(DecodingError?)
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
        switch self {
        case .badURL:
            return "invalid url"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(let statusCode):
            return "request failed with status code \(statusCode)"
        case .url(let error):
            return error.localizedDescription
        case .unknown:
            return "something bizzare failed"
            
        }
    }
}
