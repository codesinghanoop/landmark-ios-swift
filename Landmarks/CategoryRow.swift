//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Anoop Singh on 13/09/2022.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack {
            
        Text(categoryName)
            .font(.headline)
            .padding(.leading, 15)
            .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                    ForEach(items) {
                        key in
                        NavigationLink {
                            LandmarkDetail(landmark: key)
                        } label: {
                            CategoryItem(landmark: key)
                        }
                        
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
                        items: Array(landmarks.prefix(4))
        )
    }
}
