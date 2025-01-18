//
//  ProfileHeaderView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 8){
                    Text(user?.username ?? "")
                        .font(.system(size: 22))
                        .bold()
                    Text(user?.fullname ?? "")
                        .font(.system(size: 13))
                    
                }
                if let bio = user?.bio {
                    Text(bio)
                        .font(.system(size: 14))
                        .padding(.vertical, 8)
                }
            }
            Spacer()
            CircleProfilePic(user: user, size: .large)
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER)
}
