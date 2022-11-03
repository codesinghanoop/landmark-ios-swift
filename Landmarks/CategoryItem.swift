//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Anoop Singh on 13/09/2022.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
