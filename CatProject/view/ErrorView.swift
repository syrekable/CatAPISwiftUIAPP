//
//  ErrorView.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack {
            Text("😿")
            Text(breedFetcher.errorMessage ?? "")
                .padding()
            Button("Try again") {
                breedFetcher.fetchAllBreeds()
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher.errorState())
    }
}
