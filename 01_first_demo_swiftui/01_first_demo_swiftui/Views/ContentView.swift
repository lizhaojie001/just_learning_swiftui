//
//  ContentView.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI

struct CircleImage : View {
    var image : Image
    var body: some View {
            image
            .background(){Color.purple}
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray,lineWidth: 4))
            .shadow(radius: 7)
        
    }
}


struct Star: View {
    var color: Color

    var body: some View {
        Image(systemName: "star")
            .foregroundStyle(color)
    }
}
struct ContentView: View {
    var body: some View {
        LandmarkList()
            .ignoresSafeArea(edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


