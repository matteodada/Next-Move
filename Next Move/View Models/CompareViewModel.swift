//
//  ExperimentCompareViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/31/21.
//

import Foundation
import Combine

class CompareViewModel: ObservableObject {
    
    var locations = [Location]()
    
    var categories = ["housing", "cost of living", "start-ups", "venture capital",
                      "travel connectivity", "commute", "business freedom", "safety",
                      "healthcare", "education", "environmental quality", "economy",
                      "taxation", "internet access", "leisure & culture", "tolerance",
                      "outdoors"]
    
    @Published var score1: [String : Double] = ["housing": 0.0, "cost of living": 0.0, "start-ups": 0.0, "venture capital": 0.0,
                                                "travel connectivity": 0.0, "commute": 0.0, "business freedom": 0.0, "safety": 0.0,
                                                "healthcare": 0.0, "education": 0.0, "environmental quality": 0.0, "economy": 0.0,
                                                "taxation": 0.0, "internet access": 0.0, "leisure & culture": 0.0, "tolerance": 0.0,
                                                "outdoors": 0.0]
    
    @Published var score2: [String : Double] = ["housing": 0.0, "cost of living": 0.0, "start-ups": 0.0, "venture capital": 0.0,
                                                "travel connectivity": 0.0, "commute": 0.0, "business freedom": 0.0, "safety": 0.0,
                                                "healthcare": 0.0, "education": 0.0, "environmental quality": 0.0, "economy": 0.0,
                                                "taxation": 0.0, "internet access": 0.0, "leisure & culture": 0.0, "tolerance": 0.0,
                                                "outdoors": 0.0]
    
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
            self.score1["start-ups"] = newData.startUpsScore
            self.score1["venture capital"] = newData.ventureCapitalScore
            self.score1["travel connectivity"] = newData.travelConnectivityScore
            self.score1["commute"] = newData.commuteScore
            self.score1["business freedom"] = newData.businessFreedomScore
            self.score1["safety"] = newData.safetyScore
            self.score1["healthcare"] = newData.healthcareScore
            self.score1["education"] = newData.educationScore
            self.score1["environmental quality"] = newData.environmentalQualityScore
            self.score1["economy"] = newData.economyScore
            self.score1["taxation"] = newData.taxationScore
            self.score1["internet access"] = newData.internetAccessScore
            self.score1["leisure & culture"] = newData.cultureScore
            self.score1["tolerance"] = newData.toleranceScore
            self.score1["outdoors"] = newData.outdoorsScore
            
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
            self.score2["start-ups"] = newData.startUpsScore
            self.score2["venture capital"] = newData.ventureCapitalScore
            self.score2["travel connectivity"] = newData.travelConnectivityScore
            self.score2["commute"] = newData.commuteScore
            self.score2["business freedom"] = newData.businessFreedomScore
            self.score2["safety"] = newData.safetyScore
            self.score2["healthcare"] = newData.healthcareScore
            self.score2["education"] = newData.educationScore
            self.score2["environmental quality"] = newData.environmentalQualityScore
            self.score2["economy"] = newData.economyScore
            self.score2["taxation"] = newData.taxationScore
            self.score2["internet access"] = newData.internetAccessScore
            self.score2["leisure & culture"] = newData.cultureScore
            self.score2["tolerance"] = newData.toleranceScore
            self.score2["outdoors"] = newData.outdoorsScore

        })
        
        
    }
}

