//
//  FeatureCard.swift
//  07_Interfacing_with_UIKit
//
//  Created by xdf_yanqing on 2022/8/17.
//

import SwiftUI

struct FeatureCard: View {
    var landmark : LankMark
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3/2.0, contentMode: .fit)
            .overlay(content: {
                TextOverlay(landmark: landmark)
            })
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().landmarks[0])
    }
}


struct TextOverlay : View {
    
    var landmark : LankMark
    var gradient : LinearGradient {
        .linearGradient(colors: [.black.opacity(0.6),.black.opacity(0)], startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            gradient
            VStack(alignment: .leading, spacing: 0) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        })
        .foregroundColor(.white)
    }
    
}
