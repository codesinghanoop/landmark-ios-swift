//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Anoop Singh on 23/08/2022.
//

import SwiftUI

@main //Identify apps entry point
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene { //Body property returns one or more scenes, which in turn provide content for display.
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
