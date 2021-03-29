//
//  HomeView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewViewModel = HomeViewViewModel()
    
    var body: some View {
        
        ScrollView {
            
          ZStack  {
             
                Color.white
                
                Circle()
                    .frame(width: 600, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.init(white: 1.0))
                    .position(x: 60.0, y: -35.0)
                    .shadow(radius: 50)
                
                VStack {
                    
                    HStack {
                        
                        Text("Find")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 40, leading: 20, bottom: 5, trailing: 100))

                        
                        Spacer()
                        
                    }
                    
                    HStack {

                        Text("Your")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 100))


                        Spacer()

                    }
                    
                    HStack {
                        
                        Text("Next Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 100))

                        
                        Spacer()
                        
                    }
                    
     
                
                    HStack {
                        
                        Text("Popular Destinations")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 95, leading: 20, bottom: 5, trailing: 10))
                            .lineLimit(1)

                        
                        Spacer()
                    }
                    
                    VStack {
                        
                        ForEach(viewModel.popularLocations) { location in
                            ItemRow(imageName: location.imageName, cityName: location.name)
                        }
                
                        
                    }.padding(.top)

                    
                    Spacer()
                    
                }
                
            }
            
        }.onAppear(perform: { viewModel.getStartInfo() })
    }
}

struct ItemRow: View {
    
    var imageName: String
    var cityName: String
    
    var body: some View {
        
        ZStack {
            
            Color.white
            
            HStack {
                
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                
                Spacer()
                
                Text(cityName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "arrow.right.square.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20)
                    .foregroundColor(.orange)
                

            }
            
        }.cornerRadius(15)
        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
        .shadow(radius: 10)
        .onTapGesture {
            print(cityName)
        }
        
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
