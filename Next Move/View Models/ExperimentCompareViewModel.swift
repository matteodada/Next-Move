//
//  ExperimentCompareViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/31/21.
//

import Foundation
import Combine

class ExperimentCompareViewModel: ObservableObject {
    
    @Published var score1: [String : Double] = ["housing": 0.0,
                                                "culture": 0.0,
                                                "cost of living": 0.0,
                                                "commute": 0.0]
    
    @Published var score2: [String : Double] = ["housing": 0.0,
                                                "culture": 0.0,
                                                "cost of living": 0.0,
                                                "commute": 0.0]
    
    var cancellable: AnyCancellable?
    
    var cancellable2: AnyCancellable?
    
    func getScore(url: String) {
        
        cancellable = WebService.getData(url: url).sink(receiveCompletion: { _ in
            
            // completion handler
            
            
        }, receiveValue: { cityDataModel in
            
            let newData = CityDataViewModel(cityData: cityDataModel)
            
                self.score1["housing"] = newData.housingScore
            
        })
    }
    
    func getScore2(url: String) {
        
        cancellable2 = WebService.getData(url: url).sink(receiveCompletion: { _ in
            
            // completion handler
            
        }, receiveValue: { cityDataModel in
            
            let newData = CityDataViewModel(cityData: cityDataModel)
            
                self.score2["housing"] = newData.housingScore
        })
        
        
    }
}

