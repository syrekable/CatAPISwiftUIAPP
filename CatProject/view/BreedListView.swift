//
//  BreedListView.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    @State private var searchText = ""
    var filteredBreeds: [Breed] {
        if searchText.isEmpty {
            return breeds
        } else {
            return breeds.filter({ $0.name.contains(searchText)})
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetails(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("Find the loveliest cat")
                .searchable(text: $searchText)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
