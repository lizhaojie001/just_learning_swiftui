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
        Text(landmark.name)
        Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
        LandmarkRow(landmark: landmarks[2])
        }
        .previewLayout(.fixed(width: 200, height: 70))
    }
}
