//
//  APIError.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation

enum APIError: Error {
    case badURL
    case response(statusCode: Int)
    case url(URLError)
    case parsing
    case unknown
}
