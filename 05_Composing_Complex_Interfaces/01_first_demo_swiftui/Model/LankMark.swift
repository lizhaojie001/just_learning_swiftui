//
//  LankMark.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import Foundation
import SwiftUI
import MapKit
struct  LankMark : Hashable , Codable ,Identifiable  {
    var id : Int
    var name : String
    var park : String
    var state : String
    var description : String
    var isFavorite : Bool
    var isFeatured : Bool
    
    var category:Category
    enum Category:String,CaseIterable,Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountaions = "Mountains"
    }
    
    private var imageName : String
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates : Coordinates
    
    var locationCoordinate:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
    
    struct Coordinates : Hashable , Codable{
        var latitude : Double
        var longitude : Double
    }
    
}
