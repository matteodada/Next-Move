//
//  CityDataViewModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation
import SwiftUI
import Combine


struct CityDataViewModel {
    
    let cityData: CityDataModel
    
    var cityScore: Double {
        
        // do some formating to get back rounded value
        
        return cityData.teleport_city_score
    }
    
    var housingScore: Double {
        
        // check the name to be sure if time
        return cityData.categories[0].score_out_of_10
    }
    
    var costOfLivingScore: Double {
        
        
        return cityData.categories[1].score_out_of_10
    }
    
    var startUpsScore: Double {
        
        
        return cityData.categories[2].score_out_of_10
    }
    
    var ventureCapitalScore: Double {
        
        
        return cityData.categories[3].score_out_of_10
    }
    
    var travelConnectivityScore: Double {
        
        
        return cityData.categories[4].score_out_of_10
    }
    
    var commuteScore: Double {
        
        
        return cityData.categories[5].score_out_of_10
    }
    
    var businessFreedomScore: Double {
        
        
        return cityData.categories[6].score_out_of_10
    }
    
    var safetyScore: Double {
        
        
        return cityData.categories[7].score_out_of_10
    }
    
    var healthcareScore: Double {
        
        
        return cityData.categories[8].score_out_of_10
    }
    
    var educationScore: Double {
        
        
        return cityData.categories[9].score_out_of_10
    }
    
    var environmentalQualityScore: Double {
        
        
        return cityData.categories[10].score_out_of_10
    }
    
    var economyScore: Double {
        
        
        return cityData.categories[11].score_out_of_10
    }
    
    var taxationScore: Double {
        
        
        return cityData.categories[12].score_out_of_10
    }
    
    var internetAccessScore: Double {
        
        
        return cityData.categories[13].score_out_of_10
    }
    
    var cultureScore: Double {
        
        
        return cityData.categories[14].score_out_of_10
    }
    
    var toleranceScore: Double {
        
        
        return cityData.categories[15].score_out_of_10
    }
    
    var outdoorsScore: Double {
        
        
        return cityData.categories[16].score_out_of_10
    }
    
    

    

}


