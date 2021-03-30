//
//  CityDetailViewViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import SwiftUI
import Combine


class CityDetailViewViewModel: ObservableObject {
    
    private let webService = WebService()
    
    private let homeViewModel = HomeViewViewModel()
    
    @Published var cityDataViewModel: CityDataViewModel?
    
    var cancellable: AnyCancellable?
        
    func getData() {
        
        cancellable = webService.getData(url: "this is warnign").sink(receiveCompletion: { _ in
            
        }, receiveValue: { cityDataModel in
            
            let receivedValue = CityDataViewModel(cityData: cityDataModel)
            
            
//            print(receivedValue.cityScore)
//            print(receivedValue.housingScore)
//            print(receivedValue.costOfLivingScore)
//            print(receivedValue.startUpsScore)
//            print(receivedValue.ventureCapitalScore)
//            print(receivedValue.travelConnectivityScore)
//            print(receivedValue.commuteScore)
//            print(receivedValue.businessFreedomScore)
//            print(receivedValue.safetyScore)
//            print(receivedValue.healthcareScore)
//            print(receivedValue.educationScore)
//            print(receivedValue.environmentalQualityScore)
//            print(receivedValue.economyScore)
//            print(receivedValue.taxationScore)
//            print(receivedValue.internetAccessScore)
//            print(receivedValue.cultureScore)
//            print(receivedValue.toleranceScore)
//            print(receivedValue.outdoorsScore)
        })
        
        
    }

}
