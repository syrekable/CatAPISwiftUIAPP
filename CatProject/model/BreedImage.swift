//
//  BreedImage.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation

struct BreedImage: Codable {
    // TODO: how to store it as an URL?
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
}
