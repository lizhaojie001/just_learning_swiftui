//
//  _1_first_demo_swiftuiApp.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI

@main
struct _1_first_demo_swiftuiApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
//            LandmarkRow(landmark: landmarks[0])
        }
        .commands {
            LandmarkCommands()
        }
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
