//
//  MapView.swift
//  Next Move
//
//  Created by Matteo Dada Onillon on 3/29/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject private var homeViewViewModel: HomeViewViewModel = HomeViewViewModel()
    
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.43, longitude: -99.13),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    var body: some View {
        
        Map(coordinateRegion: $coordinateRegion, annotationItems: homeViewViewModel.locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude,
                                                             longitude: location.longitude)) {
                
                Button(action: { print(location.name) }, label: {
                    
                    Image(systemName: "house.fill")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.customPurple)

                })
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: { homeViewViewModel.getStartInfo() })
        
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
