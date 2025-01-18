//
//  TextFieldLoginModifier.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct TextFieldLoginModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray5))
            .clipShape(.buttonBorder)
            .padding(.horizontal, 24)
    }
}
