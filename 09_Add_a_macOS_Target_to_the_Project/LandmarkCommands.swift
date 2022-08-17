//
//  LandmarkCommands.swift
//  09_Add_a_macOS_Target_to_the_Project
//
//  Created by xdf_yanqing on 2022/8/17.
//

import SwiftUI

struct LandmarkCommands : Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    var body: some Commands {
        SidebarCommands()
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark" )") {
                selectedLandmark?.isFavorite.toggle()
            }
            .disabled(selectedLandmark == nil)
            .keyboardShortcut("f",modifiers: [.shift,.option])
        }
    }
}


private struct SelecedLandmarkKey:FocusedValueKey {
    typealias Value = Binding<LankMark>
}

extension FocusedValues {
    var selectedLandmark:Binding<LankMark>? {
        get{ self[SelecedLandmarkKey.self]}
        set{ self[SelecedLandmarkKey.self] = newValue}
    }
}
