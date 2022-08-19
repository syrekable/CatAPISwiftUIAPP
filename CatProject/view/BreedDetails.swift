//
//  BreedDetails.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 19/08/2022.
//

import SwiftUI

struct BreedDetails: View {
    let breed: Breed
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(breed.name)
                        .font(.title)
                    Spacer()
                }
                HStack {
                    ForEach(breed.temperament, id: \.self) { trait in
                        Text(trait)
                            .font(.system(size: 11))
                    }
                    Spacer()
                }
            }.padding([.vertical], 5)
            
            Text(breed.breedDescription)
        }
        .padding()
        // TODO: affection rating
    }
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: Breed.sampleData[0])
    }
}
