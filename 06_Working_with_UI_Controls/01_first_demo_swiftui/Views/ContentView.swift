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
    
    @State private var selection : Tab = .featured
    
    init() {
            
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)

            LandmarkList()
                .tabItem({
                    Label("Featured", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
        .accentColor(.orange)
        .ignoresSafeArea(edges: .top)

       
    }
    
    enum Tab {
        case featured
        case list
        case user
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(ModelData())
        }
    }
}


