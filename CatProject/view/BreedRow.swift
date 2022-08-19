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
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                Text(breed.temperament)
                    .font(.system(size: 15))
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.sampleData[0])
    }
}
