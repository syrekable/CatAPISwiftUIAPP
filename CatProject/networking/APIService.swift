//
//  APIService.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation


struct APIService {
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        // failed to construct URL
        guard let url = url else {
            completion(.failure(.badURL))
            return
        }
        
         let task = URLSession.shared.dataTask(with: url) {data, response, error in
             // there is a system error, ex. no internet
             if let error = error {
                 completion(.failure(.url(error as! URLError)))
             } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                 // the response is invalid
                     completion(.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let breeds = try JSONDecoder().decode([Breed].self, from: data)
                    completion(.success(breeds))
                } catch {
                    completion(.failure(.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
    /// Fetches data from a URL and decodes it into any Decodable type.
    /// Features error handling for system, url, status code and decoding errors.
    func fetch<T: Decodable>(url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = url else {
            completion(.failure(.badURL))
            return
        }
        
         let task = URLSession.shared.dataTask(with: url) {data, response, error in
             if let error = error {
                 completion(.failure(.url(error as! URLError)))
             } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                     completion(.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
