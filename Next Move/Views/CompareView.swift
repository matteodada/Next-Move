//
//  ExperimentCompareView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/31/21.
//

import SwiftUI

struct CompareView: View {
    
    @ObservedObject var viewModel = CompareViewModel()
    
    @State var comparedCity1: String = "Pick a City"
    @State var comparedCity2: String = "Pick a City"
    
    @State var isPresentingModal1 = false
    @State var isPresentingModal2 = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.customPurple)]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color.customPurple)]
    }
    
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
                    
                    
                    ZStack {
                        
                        Color.customWP
                        
                        HStack {
                            
                            Button(action: { self.isPresentingModal1.toggle()}, label: {
                                
                                Text(comparedCity1)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.customBW)
                                
                            })
                            .sheet(isPresented: $isPresentingModal1, content: {
                                
                                PickerModal(viewModel: viewModel,
                                            isPresented: $isPresentingModal1,
                                            cityPickedName: $comparedCity1,
                                            isCity1Selected: true)
                            })
                        }
                    }
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .frame(width: 250, height: 50)
                    .padding(EdgeInsets(top: 30.0, leading: 25.0, bottom: 15.0, trailing: 100))
                    
                    
                    ZStack {

                        Color.customWP

                        HStack {

                            Button(action: { self.isPresentingModal2.toggle()}, label: {

                                Text(comparedCity2)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.customBW)

                            })
                            .sheet(isPresented: $isPresentingModal2, content: {

                                PickerModal(viewModel: viewModel,
                                            isPresented: $isPresentingModal2,
                                            cityPickedName: $comparedCity2,
                                            isCity1Selected: false)
                            })
                        }
                    }
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .frame(width: 250, height: 50)
                    .padding(EdgeInsets(top: 15.0, leading: 100, bottom: 30.0, trailing: 25.0))
                    
                    CompareCityScoreView(cityScore1: viewModel.cityScore1,
                                            cityScore2: viewModel.cityScore2)
                        .padding(.top)
                        .padding(.bottom)
                    
                    ForEach(viewModel.categories, id: \.self) { categorie in
                        
                        CompareScoreView(name: categorie.capitalized,
                                            progress1: viewModel.score1[categorie] ?? 0.0,
                                            progress2: viewModel.score2[categorie] ?? 0.0)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getLocations()
        })
    }
}


struct PickerModal: View {
    
    var viewModel: CompareViewModel
    
    @Binding var isPresented: Bool
    @Binding var cityPickedName: String
    
    var isCity1Selected: Bool
    
    var body: some View {
        
        NavigationView {
            
            List(viewModel.locations) { location in
                
                Button(action: {
                    
                    cityPickedName = location.name;
                    self.isPresented = false;
                    
                    if isCity1Selected {
                        self.viewModel.getScore(url: location.url)
                    } else {
                        self.viewModel.getScore2(url: location.url)
                    }
                },
                       
                       label: {
                    
                    Text(location.name)
                        .font(.title)
                    
                })
                
            }
            .padding()
            .onAppear(perform: { viewModel.getLocations() })
            .navigationTitle("Pick a City").font(.system(size: 40, weight: .black, design: .rounded))
        }
        
    }
}





struct CompareCityScoreView: View {
    
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
                
                CircleCityScoreView(cityScore: cityScore1)
                
                Spacer()
                
                CircleCityScoreView(cityScore: cityScore2)
                
                Spacer()
                
            }
        }
    }
}

struct CircleCityScoreView: View {
    
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

struct CompareScoreView: View {
    
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
                    
                    BarView(progress: progress1)
                    
                    Spacer()
                    
                    BarView(progress: progress2)
                    
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


struct BarView: View {
    
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

struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
