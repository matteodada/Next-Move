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
        
        
        ScrollView {
            
            ZStack {
                
                Color(.systemBackground)
                
                Circle()
                    .frame(width: 600, height: 700, alignment: .center)
                    .foregroundColor(.init(white: 1.0))
                    .position(x: 330.0, y: -35.0)
                    .shadow(radius: 50)
                
                VStack {
                    
                    Text("Next Move")
                        .font(.largeTitle)
                        .foregroundColor(.customPurple)
                        .fontWeight(.bold)
                    
                    Text("Comparator")
                        .font(.largeTitle)
                        .foregroundColor(.customPurple)
                        .fontWeight(.bold)
                    
                    ExperimentCityScoreView(cityScore1: viewModel.cityScore1,
                                            cityScore2: viewModel.cityScore2)
                        .padding(.top)
                        .padding(.bottom)
                    
                    ForEach(viewModel.categories, id: \.self) { categorie in
                        
                        ExperimentScoreView(name: categorie.capitalized,
                                            progress1: viewModel.score1[categorie] ?? 0.0,
                                            progress2: viewModel.score2[categorie] ?? 0.0)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getScore(url: "paris");
            viewModel.getScore2(url: "london")
        })
    }
}

struct ExperimentCityScoreView: View {
    
    var cityScore1: Double
    var cityScore2: Double
    
    var body: some View {
        
        VStack {
            
            Text("City Score")
                .font(.title)
                .foregroundColor(.customPurple)
                .fontWeight(.bold)
            
            HStack {
                
                Spacer()
                
                ExperimentCircleCityScoreView(cityScore: cityScore1)
                
                Spacer()
                
                ExperimentCircleCityScoreView(cityScore: cityScore2)
                
                Spacer()
                
            }
        }
    }
}

struct ExperimentCircleCityScoreView: View {
    
    var cityScore: Double
    
    var body: some View {
        
        ZStack {
            
            Color.white
            
            Text(String(cityScore))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(cityScore < 60.0 ? .red : .green)
            
        }
        .clipShape(Circle())
        .cornerRadius(15)
        .frame(width: 150, height: 150)
        .shadow(radius: 5)    }
}

struct ExperimentScoreView: View {
    
    var name: String
    var progress1: Double
    var progress2: Double
    
    var body: some View {
        
        ZStack {
            
            Color.customPurple
            
            VStack {
                
                Text(name)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    
                    Spacer()
                    
                    ExperimentBarView(progress: progress1)
                    
                    Spacer()
                    
                    ExperimentBarView(progress: progress2)
                    
                    Spacer()
                }
                
            }
            .padding(.bottom)
            
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
        
    }
}


struct ExperimentBarView: View {
    
    var progress: Double
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .bottom) {
                
                Rectangle()
                    .foregroundColor(.init(white: 0.8))
                    .frame(width: 50, height: 150)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                
                Color.customCyanite
                    .frame(width: 50, height: CGFloat(progress * 15))
                    .cornerRadius(12)
            }
            
            Text(String(progress))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.customCyanite)
        }
    }
}

struct ExperimentCompareView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentCompareView()
    }
}
