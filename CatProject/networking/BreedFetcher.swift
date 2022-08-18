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
        // for some unknown reason, the objects are magically correct
        // if you supply the limit parameter.
        // Nothing changes in structure of anything... Jesus.
        let breedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds?limit=9")!
        let task = URLSession.shared.dataTask(with: breedsUrl) {[unowned self] data, response, error in
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
                    // TODO: show error in ui
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        task.resume()
    }
}
