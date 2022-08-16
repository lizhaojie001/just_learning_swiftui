//
//  ProfileHost.swift
//  06_Working_with_UI_Controls
//
//  Created by xdf_yanqing on 2022/8/16.
//

import SwiftUI
import Foundation
struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData : ModelData
    @State private var draftProfile = Profile.default

    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancle",role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
             } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        })
        .padding()
    }
   

    
    
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
            
    }
}
