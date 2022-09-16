//
//  ContentView.swift
//  BucketListIntro
//
//  Created by Jacek Kosinski U on 16/09/2022.
//

import SwiftUI
import MapKit


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 50.24839, longitude: 18.99989), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
    
  let locations = [
    Location(name: "Gabos S.A.", coordinate: CLLocationCoordinate2D(latitude: 50.24839, longitude: 18.99989)),
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    Location(name: "PISDZIELCE", coordinate: CLLocationCoordinate2D(latitude: 52.22414, longitude: 20.99068)),
    Location(name: "Mysterious Pattern", coordinate: CLLocationCoordinate2D(latitude: 37.629562, longitude: -116.849556)),
    Location(name: "Uluru", coordinate: CLLocationCoordinate2D(latitude: -25.344375, longitude: 131.034401)),
    Location(name: "Grand Prismatic Spring", coordinate: CLLocationCoordinate2D(latitude: 44.525049, longitude: -110.83819))
    
    
  ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate){
                    NavigationLink{
                        Text(location.name)
                    } label: {
                        VStack{
                            Circle()
                                .stroke(.red,lineWidth: 3)
                                .frame(width:44,height:44)
                            Text(location.name)
                        }
                    }
                }
            }
            
            
        }.navigationTitle("World Explorer")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
