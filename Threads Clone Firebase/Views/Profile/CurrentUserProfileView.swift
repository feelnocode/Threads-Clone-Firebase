//
//  ProfileView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State var viewModel = CurrentUserProfileViewModel()
    @Environment(\.colorScheme) var colorScheme
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
        ScrollView{
            HStack(spacing: 12){
                Button {
                    AuthService.shared.logOut()
                } label: {
                    Image(systemName: "globe")
                }
                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "chart.bar")
                }
                Button {
                    //
                } label: {
                    Image(systemName: "link")
                }
                Button {
                    //
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
            }
            .font(.system(size: 22))
            .foregroundStyle(colorScheme == .light ? .black : .white)
            .padding(.horizontal)
            .padding(.top, 14)
            
            ProfileHeaderView(user: currentUser)
            
            HStack(spacing: 12){
                Button {
                    viewModel.showingSheet.toggle()
                } label: {
                    Text("Edit profile")
                        .modifier(ProfileActionButtonViewModifier())
                }
                
                Button {
                    //
                } label: {
                    Text("Share profile")
                        .modifier(ProfileActionButtonViewModifier())
                }
            }
            .padding(.top, 10)
            
            VStack{
                if let user = currentUser {
                    ProfileThreadFilterComponent(user: user)
                }
            }
            .padding(.top, 15)
        }
        .refreshable {
            viewModel.refresh.toggle()
        }
        .background(.mainBackground)
        .sheet(isPresented: $viewModel.showingSheet) {
            if let user = currentUser {
                EditProfileView(user: user)
            }
        }
    }
    }
}

#Preview {
   CurrentUserProfileView()
}
