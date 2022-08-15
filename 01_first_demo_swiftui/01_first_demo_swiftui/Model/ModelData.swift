//
//  ModelData.swift
//  01_first_demo_swiftui
//
//  Created by xdf_yanqing on 2022/8/12.
//

import Foundation

var landmarks:[LankMark] = load("landmarkData.json")

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
