//
//  BreedFetcher.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    // If I'm not loading, either something went wrong or fetching gone succesfully
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        // TODO: handle bad url error
        let breedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds")!
        let task = URLSession.shared.dataTask(with: breedsUrl) {[unowned self] data, response, error in
            
            if let response = response as? HTTPURLResponse {
                !(200...299).contains(response.statusCode)
                // TODO: throw error
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
            if let data = data {
                do {
                    let breeds = try JSONDecoder().decode([Breed].self, from: data)
                    DispatchQueue.main.async {
                        self.breeds = breeds
                    }                   
                } catch {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        task.resume()
    }
}
