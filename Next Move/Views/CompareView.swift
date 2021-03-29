//
//  CompareView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI

struct CompareView: View {
    var body: some View {
        
        VStack {
            
            Text("This is").font(.largeTitle).foregroundColor(.orange)
            
            Text("The").font(.largeTitle).foregroundColor(.black)
            
            Text("Comparator View").font(.largeTitle).foregroundColor(.orange)
        }
        
    }
}




struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
