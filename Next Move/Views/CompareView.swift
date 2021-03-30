//
//  CompareView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI
import Combine

struct CompareView: View {
    
    @State var comparedCityName: String = "Pick a City"
    @State var comparedCityName2: String = "Pick a City"
    
    @ObservedObject private var homeViewViewModel: HomeViewViewModel = HomeViewViewModel()
    
    @ObservedObject private var compareViewViewModel = CompareViewViewModel()
    @ObservedObject private var compareViewViewModel2 = CompareViewViewModel2()
    
    @State var isPresentingModal = false
    @State var isPresentingModal2 = false
    
    var body: some View {
        
        ScrollView {
            
            ZStack {
                
                Color.white
                
                Circle()
                    .frame(width: 600, height: 700, alignment: .center)
                    .foregroundColor(.init(white: 1.0))
                    .position(x: 400.0, y: -35.0)
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
                    
                    ZStack {
                        
                        Color(.systemBackground)
                        
                        HStack {
                            
                            Button(action: { self.isPresentingModal.toggle()}, label: {
                                
                                Text(comparedCityName)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                            })
                            .sheet(isPresented: $isPresentingModal, content: {
                                ModalCityChoice(viewModel: compareViewViewModel, isPresented: $isPresentingModal, cityPickedName: $comparedCityName)
                            })
                            
                            
                        }
                        
                    }
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .frame(width: 250, height: 50)
                    .padding(EdgeInsets(top: 30.0, leading: 25.0, bottom: 15.0, trailing: 100))
                    
                    ZStack {
                        
                        Color.white
                        
                        HStack {
                            
                            Button(action: { self.isPresentingModal2.toggle()}, label: {
                                
                                Text(comparedCityName2)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                            })
                            .sheet(isPresented: $isPresentingModal2, content: {
                                ModalCityChoice2(viewModel: compareViewViewModel2, isPresented: $isPresentingModal2, cityPickedName2: $comparedCityName2)
                            })
                            
                        }
                        
                    }
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .frame(width: 250, height: 50)
                    .padding(EdgeInsets(top: 15.0, leading: 100, bottom: 30.0, trailing: 25.0))
                    
                    Text("City Score")
                        .font(.title)
                        .foregroundColor(.customPurple)
                        .fontWeight(.bold)
                    
                    HStack {
                        
                        Spacer()
                
                        ZStack {
                            
                            Color.white
                            
                            Text(String(compareViewViewModel.scoreData?.cityScore ?? 0.0))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            
                        }
                        .clipShape(Circle())
                        .cornerRadius(15)
                        .frame(width: 150, height: 150)
                        .shadow(radius: 5)
                        
                        Spacer()
                        
                        ZStack {
                            
                            Color.white
                            
                            Text(String(compareViewViewModel2.scoreData?.cityScore ?? 0.0))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                            
                        }
                        .clipShape(Circle())
                        .cornerRadius(15)
                        .frame(width: 150, height: 150)
                        .shadow(radius: 5)
                        
                        Spacer()

                    }
                    .padding(.top)
                    .padding(.bottom)
                    
                    BarViewList(housingScore: compareViewViewModel.housingScore,
                                costOflivingScore: compareViewViewModel.costOflivingScore,
                                startUpsScore: compareViewViewModel.startUpsScore,
                                ventureCapitalScore: compareViewViewModel.ventureCapitalScore,
                                travelConnectivityScore: compareViewViewModel.travelConnectivityScore,
                                commuteScore: compareViewViewModel.commuteScore,
                                businessFreedomScore: compareViewViewModel.businessFreedomScore,
                                safetyScore: compareViewViewModel.safetyScore,
                                healthcareScore: compareViewViewModel.healthcareScore,
                                educationScore: compareViewViewModel.educationScore,
                                
                                housingScore2: compareViewViewModel2.housingScore,
                                costOflivingScore2: compareViewViewModel2.costOflivingScore,
                                startUpsScore2: compareViewViewModel2.startUpsScore,
                                ventureCapitalScore2: compareViewViewModel2.ventureCapitalScore,
                                travelConnectivityScore2: compareViewViewModel2.travelConnectivityScore,
                                commuteScore2: compareViewViewModel2.commuteScore,
                                businessFreedomScore2: compareViewViewModel2.businessFreedomScore,
                                safetyScore2: compareViewViewModel2.safetyScore,
                                healthcareScore2: compareViewViewModel2.healthcareScore,
                                educationScore2: compareViewViewModel2.educationScore)
                    
                    BarViewList2(environmentalQualityScore: compareViewViewModel.environmentalQualityScore,
                                 economyScore: compareViewViewModel.economyScore,
                                 taxationScore: compareViewViewModel.taxationScore,
                                 internetAccessScore: compareViewViewModel.internetAccessScore,
                                 cultureScore: compareViewViewModel.cultureScore,
                                 toleranceScore: compareViewViewModel.toleranceScore,
                                 outdoorsScore: compareViewViewModel.outdoorsScore,
                                 
                                 environmentalQualityScore2: compareViewViewModel2.environmentalQualityScore,
                                 economyScore2: compareViewViewModel2.economyScore,
                                 taxationScore2: compareViewViewModel2.taxationScore,
                                 internetAccessScore2: compareViewViewModel2.internetAccessScore,
                                 cultureScore2: compareViewViewModel2.cultureScore,
                                 toleranceScore2: compareViewViewModel2.toleranceScore,
                                 outdoorsScore2: compareViewViewModel2.outdoorsScore)
                }
            }
        }
        .onAppear(perform: {
            homeViewViewModel.getStartInfo()
        })
    }
}



struct ModalCityChoice: View {
    
    var viewModel: CompareViewViewModel
    
    @Binding var isPresented: Bool
    @Binding var cityPickedName: String
    
    var body: some View {
        
        List(viewModel.locations) { location in
            
            Button(action: {
                    cityPickedName = location.name;
                    self.isPresented = false;
                    self.viewModel.getLocationData(url: location.url)},
                   
                   label: {
                
                Text(location.name)
                    .font(.title)
                
            })
            
        }
        .onAppear(perform: { viewModel.getLocations() })
        
    }
}

struct ModalCityChoice2: View {
    
    var viewModel: CompareViewViewModel2
    
    @Binding var isPresented: Bool
    @Binding var cityPickedName2: String
    
    var body: some View {
        
        List(viewModel.locations) { location in
            
            Button(action: {
                    cityPickedName2 = location.name;
                    self.isPresented = false;
                    self.viewModel.getLocationData(url: location.url)},
                
                   label: {
                
                Text(location.name)
                    .font(.title)
                
            })
            
        }
        .onAppear(perform: { viewModel.getLocations() })
        
    }
}







struct BarViewList: View {
    
    
    var housingScore: Double
    var costOflivingScore: Double
    var startUpsScore: Double
    var ventureCapitalScore: Double
    var travelConnectivityScore: Double
    var commuteScore: Double
    var businessFreedomScore: Double
    var safetyScore: Double
    var healthcareScore: Double
    var educationScore: Double
    
    var housingScore2: Double
    var costOflivingScore2: Double
    var startUpsScore2: Double
    var ventureCapitalScore2: Double
    var travelConnectivityScore2: Double
    var commuteScore2: Double
    var businessFreedomScore2: Double
    var safetyScore2: Double
    var healthcareScore2: Double
    var educationScore2: Double

    var body: some View {
        
        VStack {
        
            BarViewRow(title: "Housing",
                       progress: housingScore,
                       progress2: housingScore2)
            
            BarViewRow(title: "Cost Of Living",
                       progress: costOflivingScore,
                       progress2: costOflivingScore2)

            BarViewRow(title: "StartUps",
                       progress: startUpsScore,
                       progress2: startUpsScore2)

            BarViewRow(title: "Venture Capital",
                       progress: ventureCapitalScore,
                       progress2: ventureCapitalScore2)

            BarViewRow(title: "Travel Connectivity",
                       progress: travelConnectivityScore,
                       progress2: travelConnectivityScore2)

            BarViewRow(title: "Commute",
                       progress: commuteScore,
                       progress2: commuteScore2)

            BarViewRow(title: "Business Freedom",
                       progress: businessFreedomScore,
                       progress2: businessFreedomScore2)

            BarViewRow(title: "Safety",
                       progress: safetyScore,
                       progress2: safetyScore2)

            BarViewRow(title: "Healthcare",
                       progress: healthcareScore,
                       progress2: healthcareScore2)

            BarViewRow(title: "Education",
                       progress: educationScore,
                       progress2: educationScore2)
    
        }
    }
}

struct BarViewList2: View {
        
    var environmentalQualityScore: Double
    var economyScore: Double
    var taxationScore: Double
    var internetAccessScore: Double
    var cultureScore: Double
    var toleranceScore: Double
    var outdoorsScore: Double
    
    var environmentalQualityScore2: Double
    var economyScore2: Double
    var taxationScore2: Double
    var internetAccessScore2: Double
    var cultureScore2: Double
    var toleranceScore2: Double
    var outdoorsScore2: Double
    
    
    var body: some View {
        
        VStack {
            
            BarViewRow(title: "Environmental Quality",
                       progress: environmentalQualityScore,
                       progress2: environmentalQualityScore2)

            BarViewRow(title: "Economy",
                       progress: economyScore,
                       progress2: economyScore2)

            BarViewRow(title: "Taxation",
                       progress: taxationScore,
                       progress2: taxationScore2)

            BarViewRow(title: "Internet Access",
                       progress: internetAccessScore,
                       progress2: internetAccessScore2)

            BarViewRow(title: "Culture & Leisure",
                       progress: cultureScore,
                       progress2: cultureScore2)

            BarViewRow(title: "Tolerance",
                       progress: toleranceScore,
                       progress2: toleranceScore2)

            BarViewRow(title: "Outdoors",
                       progress: outdoorsScore,
                       progress2: outdoorsScore2)
            
        }
    }
    
}
    

struct BarViewRow: View {
    
    var title: String
    var progress: Double
    var progress2: Double
    
    var body: some View {
        
        ZStack {
            
            Color.customPurple
            
            VStack {
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top)

                BarView(progress: progress, progress2: progress2)
                
            }
            .padding(.bottom)
            
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
    
    }
}


struct BarView: View {
    
    var progress: Double
    var progress2: Double
    
    var body: some View {
    
        HStack {
            
            Spacer()
            
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .foregroundColor(.init(white: 0.8))
                        .frame(width: 50, height: 150)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    
                    Color.customCyanite.frame(width: 50, height: CGFloat(progress * 15)).cornerRadius(12)
                    
                }
                
                Text(String(progress))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.customCyanite)
            }
            
            Spacer()
            
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .foregroundColor(.init(white: 0.8))
                        .frame(width: 50, height: 150)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    
                    Color.customCyanite.frame(width: 50, height: CGFloat(progress2 * 15)).cornerRadius(12)
                    
                }
                
                Text(String(progress2))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.customCyanite)
            }
            
            Spacer()
            
        }
    }
}




struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
