//
//  CategoryHome.swift
//  05_App_Design_and_Layout_Composing_Complex_Interfaces
//
//  Created by xdf_yanqing on 2022/8/16.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData : ModelData
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(),id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.landmarks)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
