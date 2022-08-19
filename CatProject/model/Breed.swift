//
//  Breed.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import Foundation
/*
 {
   "weight": {
     "imperial": "7  -  10",
     "metric": "3 - 5"
   },
   "id": "abys",
   "name": "Abyssinian",
   "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
   "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
   "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
   "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
   "origin": "Egypt",
   "country_codes": "EG",
   "country_code": "EG",
   "description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
   "life_span": "14 - 15",
   "indoor": 0,
   "lap": 1,
   "alt_names": "",
   "adaptability": 5,
   "affection_level": 5,
   "child_friendly": 3,
   "dog_friendly": 4,
   "energy_level": 5,
   "grooming": 1,
   "health_issues": 2,
   "intelligence": 5,
   "shedding_level": 2,
   "social_needs": 5,
   "stranger_friendly": 5,
   "vocalisation": 1,
   "experimental": 0,
   "hairless": 0,
   "natural": 1,
   "rare": 0,
   "rex": 0,
   "suppressed_tail": 0,
   "short_legs": 0,
   "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
   "hypoallergenic": 0,
   "reference_image_id": "0XYvRd7oD",
   "image": {
     "id": "0XYvRd7oD",
     "width": 1204,
     "height": 1445,
     "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
   }
 }
 */
struct Breed: Codable, Identifiable {
    let id: String
    let name: String
    let affectionLevel: Int
    let isRare: Bool
    let breedDescription: String
    let image: BreedImage?
    let temperament: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, temperament
        case breedDescription = "description"
        case affectionLevel = "affection_level"
        case isRare = "rare"
    }
    
    // custom initializer to deal with API that does not really
    // live up to expectations
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // it all matches, no trouble
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        affectionLevel = try values.decode(Int.self, forKey: .affectionLevel)
        breedDescription = try values.decode(String.self, forKey: .breedDescription)
        
        // but now, the API serves me an Int instead of Bool.
        // How to deal with that?
        let rarity = try values.decode(Int.self, forKey: .isRare)
        // just like that; simple logical test
        isRare = rarity == 1
        
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
        
        var _temperament = try values.decode(String.self, forKey: .temperament)
        _temperament.removeAll(where: { $0 == " " })
        temperament = _temperament.split(separator: ",").map { String($0) }
    }
    
    init(id: String, name: String, affectionLevel: Int, isRare: Bool, breedDescription: String, image: BreedImage? = nil, temperament: [String]) {
        self.id = id
        self.name = name
        self.affectionLevel = affectionLevel
        self.isRare = isRare
        self.breedDescription = breedDescription
        self.image = image
        self.temperament = temperament
    }
}

extension Breed {
    /// Sample cats, with description of different lengths.
    static var sampleData: [Breed] {
        return [
            Breed(id: "abys",
                  name: "Abyssinian",
                  affectionLevel: 5,
                  isRare: false,
                  breedDescription: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                  temperament: ["Active", "Energetic", "Independent", "Intelligent", "Gentle"]),
            Breed(id: "aege",
                  name: "Aegean",
                  affectionLevel: 4,
                  isRare: false,
                  breedDescription: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
                 temperament: ["Affectionate", "Social", "Intelligent", "Playful", "Active"])
        ]
    }
}
