//
//  ContentView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 1
    
    private let buttonImageNames = ["map", "house", "arrow.left.arrow.right"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                
                switch selectedIndex {
                case 0:
                    MapView()
                    
                case 1:
                    HomeView()
                    
                case 2:
                    CompareView()
                
                default:
                    // create an error view
                    Text("Default View")
                    
                }
            }
            
            //Spacer()
            
            Divider()
                .padding(.bottom, 14)
            
            HStack {
                
                ForEach(0..<3) { num in
                    
                    Button(action: { selectedIndex = num }, label: {
                        
                        Spacer()
                        
                        Image(systemName: buttonImageNames[num])
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(selectedIndex == num ? .orange : .init(white: 0.8))
                        
                        Spacer()
                        
                    })
                }
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
