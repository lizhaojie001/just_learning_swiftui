//
//  MapView.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI
import MapKit
struct MapView: View {
    var coordinate :CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion ()
    var body: some View {
       Map(coordinateRegion: $region)
    }
    
    private func setRegin(_ coordinate : CLLocationCoordinate2D) {
        region = MKCoordinateRegion (
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate:  CLLocationCoordinate2D(latitude: 34, longitude: 168))
    }
}
