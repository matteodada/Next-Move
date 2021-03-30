//
//  DetailView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/30/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var viewModel = CompareViewViewModel()
    
    @Binding var locationUrl: String
    @Binding var imageName: String
    @Binding var locationName: String
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                                    
                Image(imageName)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .shadow(color: .black, radius: 35)
                    .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                Text(locationName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.customPurple)
                    
                
                Spacer()
                
                CityScoreView(cityScore: viewModel.scoreData?.cityScore  ?? 0.0)
                
                ScoreViewList(housingScore: viewModel.housingScore,
                              costOfLivingScore: viewModel.scoreData?.costOfLivingScore ?? 0.0,
                              startUpsScore: viewModel.scoreData?.startUpsScore ?? 0.0,
                              ventureCapitalScore: viewModel.scoreData?.ventureCapitalScore ?? 0.0,
                              travelConnectivityScore: viewModel.scoreData?.travelConnectivityScore ?? 0.0,
                              commuteScore: viewModel.scoreData?.commuteScore ?? 0.0,
                              businessFreedomScore: viewModel.scoreData?.businessFreedomScore ?? 0.0,
                              safetyScore: viewModel.scoreData?.safetyScore ?? 0.0,
                              healthcareScore: viewModel.scoreData?.healthcareScore ?? 0.0,
                              educationScore: viewModel.scoreData?.educationScore ?? 0.0)
                
                ScoreViewList2(environmentalQualityScore: viewModel.scoreData?.environmentalQualityScore ?? 0.0,
                               economyScore: viewModel.scoreData?.economyScore ?? 0.0,
                               taxationScore: viewModel.scoreData?.taxationScore ?? 0.0,
                               internetAccessScore: viewModel.scoreData?.internetAccessScore ?? 0.0,
                               cultureScore: viewModel.scoreData?.cultureScore ?? 0.0,
                               toleranceScore: viewModel.scoreData?.toleranceScore ?? 0.0,
                               outdoorsScore: viewModel.scoreData?.outdoorsScore ?? 0.0)
                
                
            }
            
        }
        .ignoresSafeArea()
        .onAppear(perform: { viewModel.getLocations() })
        .onAppear(perform: { viewModel.getLocationData(url: locationUrl) })
        
    }
}


struct CityScoreView: View {
    
    var cityScore: Double
    
    var body: some View {
        
        ZStack {
            
            Color.customPurple
            
            HStack {
                
                Spacer()
                
                VStack {
                    
                    Spacer()
                    
                    Text("City")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.customCyanite)
                    
                    
                    Text("Score")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.customCyanite)
                    
                    Spacer()
                }
                
                Spacer()
                
                ZStack {
                    
                    Circle()
                        .frame(width: 150, height: 150, alignment: .center)
                        .foregroundColor(.customPurple)
                        .shadow(color: Color.black, radius: 10)
                        
                    
                    Text(String(cityScore))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.customCyanite)
                }
                .padding(.top, 25)
                .padding(.bottom, 25)
                
                Spacer()
            }
        }
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

struct ScoreView: View {
    
    var categorieName: String
    var score: Double
    
    var body: some View {
        
        ZStack {
            
            Color.customPurple
            
            VStack {
                
                Spacer()
                
                Text(categorieName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.customCyanite)
                    .padding(.top)
                
                Spacer()
                
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .foregroundColor(.init(white: 0.8))
                        .frame(width: 300, height: 30)
                        .cornerRadius(12)
                    
                    Color.customCyanite
                        .frame(width: CGFloat(score * 30), height: 30)
                        .cornerRadius(12)
                    
                }
                
                Text(String(score))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.customCyanite)
                    .padding(.bottom)
                
                Spacer()
            }
        }
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

struct ScoreViewList: View {
    
    var housingScore: Double
    var costOfLivingScore: Double
    var startUpsScore: Double
    var ventureCapitalScore: Double
    var travelConnectivityScore: Double
    var commuteScore: Double
    var businessFreedomScore: Double
    var safetyScore: Double
    var healthcareScore: Double
    var educationScore: Double
    
    var body: some View {
        
        VStack {
            
            ScoreView(categorieName: "Housing", score: housingScore)
            ScoreView(categorieName: "Cost Of Living", score: costOfLivingScore)
            ScoreView(categorieName: "StartUps", score: startUpsScore)
            ScoreView(categorieName: "Venture Capital", score: ventureCapitalScore)
            ScoreView(categorieName: "Travel Connectivity", score: travelConnectivityScore)
            ScoreView(categorieName: "Commute", score: commuteScore)
            ScoreView(categorieName: "Business Freedom", score: businessFreedomScore)
            ScoreView(categorieName: "Safety", score: safetyScore)
            ScoreView(categorieName: "Healthcare", score: healthcareScore)
            ScoreView(categorieName: "Education", score: educationScore)
        }
    }
}

struct ScoreViewList2: View {
    
    var environmentalQualityScore: Double
    var economyScore: Double
    var taxationScore: Double
    var internetAccessScore: Double
    var cultureScore: Double
    var toleranceScore: Double
    var outdoorsScore: Double
    
    var body: some View {
        
        VStack {
            
            ScoreView(categorieName: "Environmental Quality", score: environmentalQualityScore)
            ScoreView(categorieName: "Economy", score: economyScore)
            ScoreView(categorieName: "Taxation", score: taxationScore)
            ScoreView(categorieName: "Internet Access", score: internetAccessScore)
            ScoreView(categorieName: "Leisure & Culture", score: cultureScore)
            ScoreView(categorieName: "Tolerance", score: toleranceScore)
            ScoreView(categorieName: "Outdoors", score: outdoorsScore)

        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    
//    @Binding var isPresented: Bool
//    
//    static var previews: some View {
//        DetailView(locationUrl: "paris", imageName: "paris", locationName: "PARIS")
//    }
//}
