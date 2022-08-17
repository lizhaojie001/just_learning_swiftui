//
//  PageView.swift
//  07_Interfacing_with_UIKit
//
//  Created by xdf_yanqing on 2022/8/17.
//

import SwiftUI

struct PageView<Page:View>: View {
    @State private var currentPage : Int = 2
    var pages : [Page]
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            PageViewController(currentPage: $currentPage, pages: pages)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }) 
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
            .aspectRatio(3/2, contentMode: .fit)
    }
}
