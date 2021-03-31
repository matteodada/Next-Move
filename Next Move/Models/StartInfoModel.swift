//
//  StartInfoModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import Foundation

struct StartInfo: Decodable {
    
    let locations: [Location]
    
}

struct Location: Identifiable, Decodable {
    
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let url: String
    let imageName: String
    let isPopular: Bool
    
}
