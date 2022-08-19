//
//  BreedListView.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var body: some View {
        NavigationView {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        BreedDetails(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("Find the loveliest cat")
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
