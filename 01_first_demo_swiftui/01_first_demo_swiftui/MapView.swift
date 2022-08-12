//
//  MapView.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI
import MapKit
struct MapView: View {
    
    @State private var rigion = MKCoordinateRegion (
        center: CLLocationCoordinate2D(latitude: 34, longitude: 168), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
       Map(coordinateRegion: $rigion)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
