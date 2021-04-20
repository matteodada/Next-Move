//
//  ExperimentCompareViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/31/21.
//

import Foundation
import Combine

class ExperimentCompareViewModel: ObservableObject {
    
    var locations = [Location]()
    
    var categories = ["housing", "culture", "cost of living", "commute"]
    
    @Published var score1: [String : Double] = ["housing": 0.0,
                                                "culture": 0.0,
                                                "cost of living": 0.0,
                                                "commute": 0.0]
    
    @Published var score2: [String : Double] = ["housing": 0.0,
                                                "culture": 0.0,
                                                "cost of living": 0.0,
                                                "commute": 0.0]
    
    @Published var cityScore1: Double = 0.0
    @Published var cityScore2: Double = 0.0
    
    var cancellable: AnyCancellable?
    
    var cancellable2: AnyCancellable?
    
    
    func getLocations() {
        
            if let url = Bundle.main.url(forResource: "startInfo", withExtension: "json"),
               let data = try? Data(contentsOf: url) {
                
                let decoder = JSONDecoder()
                
                if let startInfo = try? decoder.decode(StartInfo.self, from: data) {
                    
                    locations = startInfo.locations
                }
            }
    }

    
    func getScore(url: String) {
        
        cancellable = WebService.getData(url: url).sink(receiveCompletion: { _ in
            
            // completion handler
            
            
        }, receiveValue: { cityDataModel in
            
            let newData = CityDataViewModel(cityData: cityDataModel)
            
            self.cityScore1 = newData.cityScore
            
            self.score1["housing"] = newData.housingScore
            self.score1["cost of living"] = newData.costOfLivingScore
            self.score1["culture"] = newData.cultureScore
            self.score1["commute"] = newData.commuteScore
            
        })
    }
    
    func getScore2(url: String) {
        
        cancellable2 = WebService.getData(url: url).sink(receiveCompletion: { _ in
            
            // completion handler
            
        }, receiveValue: { cityDataModel in
            
            let newData = CityDataViewModel(cityData: cityDataModel)
            
            self.cityScore2 = newData.cityScore
            
            self.score2["housing"] = newData.housingScore
            self.score2["cost of living"] = newData.costOfLivingScore
            self.score2["culture"] = newData.cultureScore
            self.score2["commute"] = newData.commuteScore

        })
        
        
    }
}

