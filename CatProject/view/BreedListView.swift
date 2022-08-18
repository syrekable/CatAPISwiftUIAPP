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
        Text("Showing \(breeds.count) breeds.")
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}
