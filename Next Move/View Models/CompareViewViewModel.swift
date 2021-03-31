//
//  CompareViewViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import SwiftUI
import Combine

class CompareViewViewModel: ObservableObject {
    
    
    @Published var locations = [Location]()
    
    @Published var scoreData: CityDataViewModel?
    
    @Published var cityScore: Double = 0.0
    
    @Published var housingScore: Double = 0.0
    @Published var costOflivingScore: Double = 0.0
    @Published var startUpsScore: Double = 0.0
    @Published var ventureCapitalScore: Double = 0.0
    @Published var travelConnectivityScore: Double = 0.0
    @Published var commuteScore: Double = 0.0
    @Published var businessFreedomScore: Double = 0.0
    @Published var safetyScore: Double = 0.0
    @Published var healthcareScore: Double = 0.0
    @Published var educationScore: Double = 0.0
    @Published var environmentalQualityScore: Double = 0.0
    @Published var economyScore: Double = 0.0
    @Published var taxationScore: Double = 0.0
    @Published var internetAccessScore: Double = 0.0
    @Published var cultureScore: Double = 0.0
    @Published var toleranceScore: Double = 0.0
    @Published var outdoorsScore: Double = 0.0
    
    var cancellable: AnyCancellable?
    
    
    func getLocations() {
        
            if let url = Bundle.main.url(forResource: "startInfo", withExtension: "json"),
               let data = try? Data(contentsOf: url) {
                
                let decoder = JSONDecoder()
                
                if let startInfo = try? decoder.decode(StartInfo.self, from: data) {
                    
                    locations = startInfo.locations
                }
            }
    }
    
    
    func getLocationData(url: String) {
        
        cancellable = WebService.getData(url: url).sink(receiveCompletion: { _ in
        
        }, receiveValue: { cityDataModel in
            
            let newData = CityDataViewModel(cityData: cityDataModel)
            
            self.scoreData = newData
            
            self.cityScore = newData.cityScore
            
            self.housingScore = newData.housingScore
            self.costOflivingScore = newData.costOfLivingScore
            self.startUpsScore = newData.startUpsScore
            self.ventureCapitalScore = newData.ventureCapitalScore
            self.travelConnectivityScore = newData.travelConnectivityScore
            self.commuteScore = newData.commuteScore
            self.businessFreedomScore = newData.businessFreedomScore
            self.safetyScore = newData.safetyScore
            self.healthcareScore = newData.healthcareScore
            self.educationScore = newData.educationScore
            self.environmentalQualityScore = newData.environmentalQualityScore
            self.economyScore = newData.economyScore
            self.taxationScore = newData.taxationScore
            self.internetAccessScore = newData.internetAccessScore
            self.cultureScore = newData.cultureScore
            self.toleranceScore = newData.toleranceScore
            self.outdoorsScore = newData.outdoorsScore
        })
    }
}
