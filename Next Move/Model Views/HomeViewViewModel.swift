//
//  HomeViewViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import Foundation
import Combine

class HomeViewViewModel: ObservableObject {
    
    @Published var locations = [Location]()
    @Published var popularLocations = [Location]()
    
    func getStartInfo() {
        
        if let url = Bundle.main.url(forResource: "startInfo", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            
            let decoder = JSONDecoder()
            
            if let startInfo = try? decoder.decode(StartInfo.self, from: data) {
                
                locations = startInfo.locations

                for location in startInfo.locations {

                    if location.isPopular {
                        popularLocations.append(location)
                    }

                }
                
            }
        }
    }
    
}
