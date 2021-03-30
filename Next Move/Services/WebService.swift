//
//  WebService.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import Combine

class WebService {
    
    func getData(url: String) -> AnyPublisher<CityDataModel, Error> {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.teleport.org"
        components.path = "/api/urban_areas/slug%3A\(url)/scores/"
        
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: CityDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
