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
        Text("Error: \(breedFetcher.errorMessage!)")
            .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
