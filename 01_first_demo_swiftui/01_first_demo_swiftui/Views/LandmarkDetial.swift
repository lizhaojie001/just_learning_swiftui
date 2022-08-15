//
//  LandmarkDetial.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI

struct LandmarkDetial: View {
    var landmark : LankMark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                     .ignoresSafeArea(edges: .top)
                     .frame(height: 300)

            CircleImage(image: landmark.image)
                     .offset(y: -130)
                     .padding(.bottom, -130)

                 VStack(alignment: .leading) {
                     Text(landmark.name)
                         .font(.title)

                     HStack {
                         Text(landmark.park)
                         Spacer()
                         Text(landmark.state)
                     }
                     .font(.subheadline)
                     .foregroundColor(.secondary)

                     Divider()

                     Text("About \(landmark.name)")
                         .font(.title2)
                     Text(landmark.description)
                 }
                 .padding()

                 Spacer()
            
                .navigationTitle(landmark.name)
                .navigationBarTitleDisplayMode(.inline)
             }
    }
}

struct LandmarkDetial_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetial(landmark: landmarks[0])
    }
}
