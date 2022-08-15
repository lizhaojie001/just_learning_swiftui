//
//  landmarklist.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//
 
import SwiftUI


struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks,id:\.id) { landmark in
                NavigationLink {
                    LandmarkDetial(landmark: landmark)
                } label: {
                    LandmarkRow(landmark:landmark)
                }
               
            }
            .navigationTitle("landmarks")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generatioin)","iPhone XS Max"], id:\.self, content: { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue:deviceName))
                .previewDisplayName(deviceName)
        }
        )
       
    }
}
