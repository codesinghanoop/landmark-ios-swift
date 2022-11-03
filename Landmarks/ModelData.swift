//
//  ModelData.swift
//  Landmarks
//
//  Created by Anoop Singh on 25/08/2022.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue }
        )
    }
    @Published var profile = Profile.default
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    //fetching file data from the main project folder
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't fetch \(filename) data")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
