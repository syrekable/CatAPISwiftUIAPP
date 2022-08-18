//
//  BreedFetcher.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    
    init() {
        
    }
    
    func fetchAllBreeds() {
        // TODO: handle bad url error
        let breedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds")!
        let task = URLSession.shared.dataTask(with: breedsUrl) { data, response, error in
            if let data = data {
                do {
                    self.breeds = try JSONDecoder().decode([Breed].self, from: data)
                } catch {
                    // TODO: show error in ui
                    print(error.localizedDescription)
                }
            }
        }
    }
}
