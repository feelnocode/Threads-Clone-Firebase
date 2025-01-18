//
//  ProfileActionViewModifier.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct ProfileActionButtonViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 176, height: 32)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            }
            .foregroundStyle(colorScheme == .light ? .black : .white)
    }
}
