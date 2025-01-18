//
//  CircleProfilePic.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI
import Kingfisher

struct CircleProfilePic: View {
    var user: User?
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl{
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(.circle)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
                .overlay {
                    Circle().stroke(Color(.systemGray3), lineWidth: 1)
                }
        }
    }
}

#Preview {
    CircleProfilePic(user: User.MOCK_USER, size: .small)
}
