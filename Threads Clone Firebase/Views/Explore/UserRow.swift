//
//  UserRow.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct UserRow: View {
    @Environment(\.colorScheme) var colorScheme
    let user: User
    var body: some View {
        VStack{
            HStack{
                CircleProfilePic(user: user, size: .small)
                VStack(alignment: .leading,spacing: 4){
                    Text(user.username)
                        .fontWeight(.semibold)
                    Text(user.fullname)
                        .opacity(0.4)
                        .lineLimit(1)
                }
                .font(.system(size: 14))
                .padding(.leading, 7)
                Spacer()
                Button {
                    //
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        }
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                }
            }

        }
        .padding(.horizontal)
    }
}

#Preview {
    UserRow(user: User.MOCK_USER)
}
