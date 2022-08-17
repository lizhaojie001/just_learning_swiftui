//
//  CircleImage.swift
//  09_Add_a_macOS_Target_to_the_Project
//
//  Created by xdf_yanqing on 2022/8/17.
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

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: ModelData().landmarks[0].image)
    }
}
