//
//  ContentView.swift
//  MacLandmarks
//
//  Created by xdf_yanqing on 2022/8/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList().frame(width: 1000, height: 700)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
