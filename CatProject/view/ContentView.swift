//
//  ContentView.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher: BreedFetcher = BreedFetcher()
    var body: some View {
        if breedFetcher.isLoading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
