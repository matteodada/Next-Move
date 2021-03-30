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
    @ObservedObject var compareViewViewModel = CompareViewViewModel()
    
    @State var isModalPresented = false
    
    @State var selectedLocation: String = ""
    @State var selectedImage: String = ""
    @State var selectedLocationName: String = ""
    
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.43, longitude: -99.13),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    func assignName(location: Location) {
        
        selectedLocation = location.url
        selectedImage = location.imageName
        selectedLocationName = location.name
        
        self.isModalPresented.toggle()
        
        
    }
    
    var body: some View {
        
        Map(coordinateRegion: $coordinateRegion, annotationItems: compareViewViewModel.locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude,
                                                             longitude: location.longitude)) {
                
                Button(action: { assignName(location: location)},
                       
                       label: {
                    
                    Image(systemName: "house.fill")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.customPurple)

                })
                
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            compareViewViewModel.getLocations()
        })
        .sheet(isPresented: $isModalPresented, content: {
            DetailView(locationUrl: $selectedLocation, imageName: $selectedImage, locationName: $selectedLocationName)
        })
        
    }
}






struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
