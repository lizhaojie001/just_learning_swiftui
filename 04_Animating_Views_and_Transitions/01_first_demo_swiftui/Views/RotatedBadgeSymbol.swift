//
//  RotatedBadgeSymbol.swift
//  03_Drawing_Paths_and_Shapes
//
//  Created by xdf_yanqing on 2022/8/16.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle:Angle
    var body: some View {
        BadgeSynbol()
            .padding(-60)
            .rotationEffect(angle,anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
