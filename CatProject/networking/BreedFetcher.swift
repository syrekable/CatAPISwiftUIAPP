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
            self.isLoading = false
            if let data = data {
                do {
                    // print(String(data: data, encoding: .utf8))
                    let breeds = try JSONDecoder().decode([Breed].self, from: data)
                    self.breeds = breeds
                } catch {
                    // TODO: show error in ui
                    print(error)
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        task.resume()
    }
}
