//
//  CityDataModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation


struct CityDataModel: Decodable {
    
    let categories: [Categorie]
    let teleport_city_score: Double
    
}

struct Categorie: Decodable {
    
    let name: String
    let score_out_of_10: Double
    
}
