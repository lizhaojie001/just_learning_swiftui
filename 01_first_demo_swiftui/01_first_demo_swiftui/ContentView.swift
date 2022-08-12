//
//  ContentView.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import SwiftUI



struct Star: View {
    var color: Color

    var body: some View {
        Image(systemName: "star")
            .foregroundStyle(color)
    }
}
struct ContentView: View {
    var body: some View {
        VStack(
            alignment: .center
        )
        {
            MapView().frame(height: 300)
            CircleImage()
                .offset(y:-100)
                .padding(.bottom,-100)
                
            
            HStack{
                Text("Hello, world!")
               
                Text("Hello, world!")
                .border(Color.red, width: 1)
            }
            
            
            HStack{
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            .padding()
            
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            .padding()
            .foregroundColor(Color.orange)
            }
            
            Divider()
            
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            .padding()
            .foregroundColor(Color.orange)
            .hoverEffect(.highlight)
            
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            .padding()
            .foregroundColor(Color.orange)
            .hoverEffect(.highlight)
            .background(alignment: .leading) { Star(color: Color.pink) }
            .background(alignment: .center) { Star(color: Color.green)}
            .background(alignment: .trailing) { Star(color: Color.blue) }
            .background(){Color.purple}
            
           
            
            Text("Hello, world!")
            .border(Color.red, width: 1)
            .font(.title)
            .padding()
            .foregroundColor(Color.orange)
            .hoverEffect(.highlight)
            //background 是有层级关系的,如果⭐️后设置,将不展示
            .background(alignment: .leading) { Star(color: Color.pink) }
            .background(alignment: .center) { Star(color: Color.green)}
            .background(alignment: .trailing) { Star(color: Color.blue) }
            .background(alignment: .trailing) { Color.purple }
            .shadow(color: Color.orange, radius: 10, x: 2, y: 2)
            
            
            Spacer()
           
           
             
        }
        .background(content: {
            Image("bg").aspectRatio(contentMode: .fit)
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


struct CircleImage : View {
    var body: some View {
        Image("star")
            .background(){Color.purple}
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray,lineWidth: 4))
            .shadow(radius: 7)
        
    }
}
