//
//  BreedRow.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 19/08/2022.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.image != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    } else if phase.error != nil {
                        Color.red.frame(width: imageSize, height: imageSize) // Indicates an error.
                    } else {
                        ProgressView() // Acts as a placeholder.
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
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
