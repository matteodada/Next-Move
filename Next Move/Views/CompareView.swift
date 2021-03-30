//
//  CompareView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI

struct CompareView: View {
    
    @State var comparedCity: String = "Pick a City"
    
    @State var comparedCity2: String = "Pick a City"
    
    
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
                    
                    Text("Compare")
                        .font(.largeTitle)
                        .foregroundColor(.customPurple)
                        .fontWeight(.bold)
                    
                    ZStack {
                        
                        Color.white
                        
                        HStack {
                            
                            Button(action: { print("modal view to change city 1")}, label: {
                                
                                Text(comparedCity)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
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
                            
                            Button(action: { print("modal view to change city 2")}, label: {
                                
                                Text(comparedCity2)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
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
                            
                            Text("58.3")
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
                            
                            Text("78.5")
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
                    
                    
                    BarViewList()
                    
                    BarViewList2()
                }
            }
        }
    }
}

struct BarViewList: View {
    
    var body: some View {
        
        VStack {
            
            BarViewRow(title: "Housing")
            BarViewRow(title: "Cost of Living")
            BarViewRow(title: "Start-Ups")
            BarViewRow(title: "Venture Capital")
            BarViewRow(title: "Travel Connectivity")
            BarViewRow(title: "Commute")
            BarViewRow(title: "Business Freedom")
            BarViewRow(title: "Safety")
            BarViewRow(title: "Healthcare")
            BarViewRow(title: "Education")
    
        }
    }
}

struct BarViewList2: View {
    
    var body: some View {
        
        VStack {
            
            BarViewRow(title: "Environmental Quality")
            BarViewRow(title: "Economy")
            BarViewRow(title: "Taxation")
            BarViewRow(title: "Internet Access")
            BarViewRow(title: "Leisure & Culture")
            BarViewRow(title: "Tolerance")
            BarViewRow(title: "Outdoors")
            
        }
    }
    
}
    


struct BarViewRow: View {
    
    var title: String = ""
    var progress: Int = 0
    var progress2: Int = 0
    
    var body: some View {
        
        ZStack {
            
            
            Color.customPurple
            
            VStack {
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top)

                
                BarView()
                
                
            }.padding(.bottom)
            
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
    
    }
}


struct BarView: View {
    
    var progress: Int = 45
    var progress2: Int = 120
    
    var body: some View {
        

        HStack {
            
            Spacer()
            
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .foregroundColor(.init(white: 0.8))
                        .frame(width: 50, height: 150)
                        .cornerRadius(12)
                    
                    Color.customCyanite.frame(width: 50, height: CGFloat(progress)).cornerRadius(12)
                    
                    
                }
                
                Text("3.4")
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
                    
                    Color.customCyanite.frame(width: 50, height: CGFloat(progress2)).cornerRadius(12)
                    
                    
                }
                
                Text("8.2")
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
