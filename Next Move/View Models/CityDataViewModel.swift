//
//  CityDataViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import SwiftUI
import Combine


struct CityDataViewModel: Identifiable {
    
    let id = UUID()
    
    let cityData: CityDataModel
    
    private func roundDouble(_ value: Double) -> Double {
        let roundedValue = round((value * 100)) / 100.0
        return roundedValue
    }

    var cityScore: Double {
        let formattedScore = roundDouble(cityData.teleport_city_score)
        return formattedScore
    }
    
    var housingScore: Double {
        let formattedScore = roundDouble(cityData.categories[0].score_out_of_10)
        return formattedScore
    }
    
    var costOfLivingScore: Double {
        let formattedScore = roundDouble(cityData.categories[1].score_out_of_10)
        return formattedScore
    }
    
    var startUpsScore: Double {
        let formattedScore = roundDouble(cityData.categories[2].score_out_of_10)
        return formattedScore
    }
    
    var ventureCapitalScore: Double {
        let formattedScore = roundDouble(cityData.categories[3].score_out_of_10)
        return formattedScore
    }
    
    var travelConnectivityScore: Double {
        let formattedScore = roundDouble(cityData.categories[4].score_out_of_10)
        return formattedScore
    }
    
    var commuteScore: Double {
        let formattedScore = roundDouble(cityData.categories[5].score_out_of_10)
        return formattedScore
    }
    
    var businessFreedomScore: Double {
        let formattedScore = roundDouble(cityData.categories[6].score_out_of_10)
        return formattedScore
    }
    
    var safetyScore: Double {
        let formattedScore = roundDouble(cityData.categories[7].score_out_of_10)
        return formattedScore
    }
    
    var healthcareScore: Double {
        let formattedScore = roundDouble(cityData.categories[8].score_out_of_10)
        return formattedScore
    }
    
    var educationScore: Double {
        let formattedScore = roundDouble(cityData.categories[9].score_out_of_10)
        return formattedScore
    }
    
    var environmentalQualityScore: Double {
        let formattedScore = roundDouble(cityData.categories[10].score_out_of_10)
        return formattedScore
    }
    
    var economyScore: Double {
        let formattedScore = roundDouble(cityData.categories[11].score_out_of_10)
        return formattedScore
    }
    
    var taxationScore: Double {
        let formattedScore = roundDouble(cityData.categories[12].score_out_of_10)
        return formattedScore
    }
    
    var internetAccessScore: Double {
        let formattedScore = roundDouble(cityData.categories[13].score_out_of_10)
        return formattedScore
    }
    
    var cultureScore: Double {
        let formattedScore = roundDouble(cityData.categories[14].score_out_of_10)
        return formattedScore
    }
    
    var toleranceScore: Double {
        let formattedScore = roundDouble(cityData.categories[15].score_out_of_10)
        return formattedScore
    }
    
    var outdoorsScore: Double {
        let formattedScore = roundDouble(cityData.categories[16].score_out_of_10)
        return formattedScore
    }
}


