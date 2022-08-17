//
//  LandmarkRow.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LankMark
    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                Text(landmark.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
        .padding(.vertical,4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        Group {
            LandmarkRow(landmark: modelData.landmarks[0])
            LandmarkRow(landmark: modelData.landmarks[1])
            LandmarkRow(landmark: modelData.landmarks[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
