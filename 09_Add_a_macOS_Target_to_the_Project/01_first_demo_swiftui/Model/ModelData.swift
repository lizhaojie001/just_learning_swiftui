//
//  ModelData.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import Foundation
import Combine

final class ModelData:ObservableObject {
    @Published var landmarks:[LankMark] = load("landmarkData.json")
    @Published var hikes :[Hike] = load("hikeData.json")
    var profile = Profile.default
    var categories : [String : [LankMark]] {
        Dictionary (
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features:[LankMark] {
        landmarks.filter {
            $0.isFeatured
        }
    }
    
    
}


func load<T:Decodable>(_ filename : String) -> T {
    let data : Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: "") else {
        fatalError("error : not find \(filename) ")
    }
    do {
        data = try Data(contentsOf: file)
    }catch {
        fatalError("load \(filename) erorr \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("decode \(filename) as \(T.self) : error \(error)")
    }
}
