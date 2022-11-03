//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Anoop Singh on 13/09/2022.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    key in
                    
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)                  }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar{
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("user profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                                        .environmentObject(modelData)
                }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
