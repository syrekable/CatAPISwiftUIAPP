//
//  BreedDetails.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 19/08/2022.
//

import SwiftUI

struct BreedDetails: View {
    let breed: Breed
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                if breed.image != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: imageSize)
                        } else if phase.error != nil {
                            ZStack {
                                Color.red
                                VStack(spacing: 5) {
                                    Text("😿")
                                    Text("An error ocurred")
                                        .foregroundColor(.white)
                                }
                            }
                                .scaledToFit()
                                .frame(height: imageSize) // Indicates an error.
                        } else {
                            ProgressView()
                                .scaledToFit()
                                .frame(height: imageSize)// Acts as a placeholder.
                        }
                    }
                } else {
                    ZStack {
                        Color.gray
                        VStack(spacing: 5) {
                            Text("🐈")
                            Text("No image")
                                .foregroundColor(.white)
                        }
                    }
                        .frame(height: imageSize)
                }
                
                VStack(alignment: .leading) {
                    Text(breed.name)
                            .font(.title)
                    Text(breed.temperament)
                        .font(.system(size: 15))
                }.padding([.vertical], 5)
                Text(breed.breedDescription)
                HStack {
                    Text("Affection level")
                    Spacer()
                    ForEach(1..<6) { i in
                        Image(systemName: "star.fill")
                            .foregroundColor(i <= breed.affectionLevel ? Color.red : Color.gray)
                    }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: Breed.sampleData[0])
    }
}
