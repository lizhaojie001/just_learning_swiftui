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
    var region : MKCoordinateRegion {
            MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
    }
    
    @AppStorage("MapView.zoom")
    private var zoom:Zoom = .medium
    enum Zoom:String ,CaseIterable,Identifiable {
    case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id:Zoom {
            return self
        }
    }
    
    var delta:CLLocationDegrees {
        switch zoom {
        case .near:
            return 0.02
        case .medium:
            return 0.2
        case .far:
            return 2
        }
    }
    
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate:  CLLocationCoordinate2D(latitude: 34, longitude: 168))
    }
}
