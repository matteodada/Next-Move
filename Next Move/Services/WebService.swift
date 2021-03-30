//
//  WebService.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import Combine

class WebService {
    
    func getData() -> AnyPublisher<CityDataModel, Error> {
        
        guard let url = URL(string: "https://api.teleport.org/api/urban_areas/slug%3Aparis/scores/") else { fatalError("invalid url") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CityDataModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
