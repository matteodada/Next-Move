//
//  ExperimentCompareView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/31/21.
//

import SwiftUI

struct ExperimentCompareView: View {
    
    @ObservedObject var viewModel = ExperimentCompareViewModel()
    
    var body: some View {
        
        
        VStack {
            
            Text("Paris")
                .font(.largeTitle)
                .padding()
            
            Text("Housing Score")
                .font(.title)
                .padding()
            
            Text(String(viewModel.score1["housing"] ?? 0.0))
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
            Text("London")
                .font(.largeTitle)
                .padding()
            
            Text("Housing Score")
                .font(.title)
                .padding()
            
            Text(String(viewModel.score2["housing"] ?? 0.0))
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
                
        }
        
        .onAppear(perform: {
            viewModel.getScore(url: "paris");
            viewModel.getScore2(url: "london")
        })

    }
}

struct ExperimentCompareView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentCompareView()
    }
}
