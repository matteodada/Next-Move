//
//  MapView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        
        VStack {
            
            Text("This Is").font(.largeTitle).foregroundColor(.orange)
            
            Text("The").font(.largeTitle).foregroundColor(.black)
            
            Text("Map View").font(.largeTitle).foregroundColor(.orange)
        }
        
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
