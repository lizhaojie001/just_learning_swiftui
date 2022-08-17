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
    private var profileSummary : ProfileSummary {
        ProfileSummary(profile: $modelData.profile)
    }
    private  var profileEditor : ProfileEditor {
        ProfileEditor(profile:$modelData.profile)
    }
    
  
    
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
                profileSummary
            } else {
                profileEditor
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
