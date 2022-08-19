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
        errorMessage = nil
        
        // ... code using an external network service layer
        // is more compact: readable and reusable!
        let service = APIService()
        let breedsUrl = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        service.fetchBreeds(url: breedsUrl) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            case .success(let breeds):
                DispatchQueue.main.async {
                    self.breeds = breeds
                }
            }
        }
        
    }
}
