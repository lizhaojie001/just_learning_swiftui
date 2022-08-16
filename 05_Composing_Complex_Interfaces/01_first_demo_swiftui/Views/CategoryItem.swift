//
//  CategoryItem.swift
//  05_App_Design_and_Layout_Composing_Complex_Interfaces
//
//  Created by xdf_yanqing on 2022/8/16.
//

import SwiftUI

struct CategoryItem: View {
    var landmark : LankMark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 18)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
