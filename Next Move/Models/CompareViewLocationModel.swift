//
//  CompareViewLocationModel.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import Foundation

struct CompareViewLocationModel: Identifiable {
    
    let id = UUID()
    
    let location: Location
    let scoreData: CityDataViewModel
    
}
