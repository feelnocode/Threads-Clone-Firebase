//
//  UserProfileView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView{
            
            ProfileHeaderView(user: user)
            
            HStack(spacing: 12){
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .background(colorScheme == .light ? .black : .white)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(colorScheme == .light ? .white : .black)
                }
            }
            .padding(.top, 10)
            
            VStack{
                ProfileThreadFilterComponent(user: user)
            }
            .padding(.top, 15)
        }
        .background(.mainBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfileView(user: User.MOCK_USER)
}
