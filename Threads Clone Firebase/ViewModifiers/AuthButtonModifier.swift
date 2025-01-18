//
//  AuthButtonModifier.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct AuthButtonModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(colorScheme == .dark ? .black : .white)
            .frame(width: 350, height: 40)
            .background(.loginItem)
            .clipShape(.buttonBorder)
    }
}

