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
            Spacer(minLength: 75)
            VStack {
                HStack {
                    Text(breed.name)
                    Spacer()
                }
                // TODO: frame it if overflowing?
                HStack {
                    ForEach(breed.temperament, id: \.self) { trait in
                        Text(trait)
                            .font(.system(size: 11))
                    }
                }
            }
        }
        .padding()
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.sampleData[0])
    }
}
