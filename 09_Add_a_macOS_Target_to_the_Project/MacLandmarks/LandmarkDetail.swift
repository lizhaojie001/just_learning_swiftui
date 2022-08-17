//
//  LandmarkDetial.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI
import MapKit

struct LandmarkDetial: View {
    @EnvironmentObject var modelData : ModelData
    var landmark : LankMark
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex {$0.id == landmark.id
        }!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            Button("Open in Map") {
                let des = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                des.name = landmark.name
                des.openInMaps()
            }
            .padding()
         
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing:24) {
                        CircleImage(image: landmark.image.resizable())
                            .frame(width: 160, height: 160)
                        HStack {
                            
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet:$modelData.landmarks[landmarkIndex].isFavorite )
                                .buttonStyle(.plain)
                        }
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
              
               
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth:700)
            .offset(y:-50)
            
        }
        .navigationTitle(landmark.name)

    }
}

struct LandmarkDetial_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        LandmarkDetial(landmark: modelData.landmarks[0]).environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}
