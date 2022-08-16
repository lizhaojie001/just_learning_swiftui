//
//  CategoryRow.swift
//  05_App_Design_and_Layout_Composing_Complex_Interfaces
//
//  Created by xdf_yanqing on 2022/8/16.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName : String
    var items : [LankMark]
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName).font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top,spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: {
                            LandmarkDetial(landmark: landmark)
                        }, label: {
                            CategoryItem(landmark: landmark)
                        })
                    }
                }
            }
            .frame(height:185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
    }
}
