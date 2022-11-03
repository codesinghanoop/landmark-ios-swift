//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Anoop Singh on 21/09/2022.
//

import SwiftUI

struct HikeBadge: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
                    Text(name)
                        .font(.caption)
                        .accessibilityLabel("Badge for \(name).")
                }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
