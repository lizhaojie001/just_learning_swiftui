//
//  landmarklist.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//
 
import SwiftUI


struct LandmarkList: View {
    @State private var showFavirutesOnly = true
    @EnvironmentObject var modelData:ModelData
    var filteredLandmarks:[LankMark]  {
        modelData.landmarks.filter { landmark in
            (!showFavirutesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavirutesOnly) {
                    Text("favorite only")
                }
            ForEach(filteredLandmarks,id:\.id) { landmark in
                NavigationLink {
                    LandmarkDetial(landmark: landmark)
                } label: {
                    LandmarkRow(landmark:landmark)
                }

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
            LandmarkList().environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue:deviceName))
                .previewDisplayName(deviceName)
        }
        )
       
    }
}
