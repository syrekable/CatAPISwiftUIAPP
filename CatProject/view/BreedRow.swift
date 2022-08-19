//
//  BreedRow.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 19/08/2022.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    var body: some View {
        HStack {
            // TODO: image
            Text(breed.name)
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.sampleData[0])
    }
}
