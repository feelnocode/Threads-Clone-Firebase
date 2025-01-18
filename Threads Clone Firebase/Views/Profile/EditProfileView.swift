//
//  EditProfileView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 14/01/2025.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let user: User
    @State private var badgeToggleIsOn = false
    @State private var privateToggleIsOn = false
    @State var viewModel = EditProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(colorScheme == .light ? .loginBackground : .black)
                    .ignoresSafeArea(edges: .bottom)
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                            } else {
                                CircleProfilePic(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                        .padding(5)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Bio")
                                .fontWeight(.semibold)
                            TextField("Enter your bio...", text: $viewModel.bio, axis: .vertical)
                        }
                        Spacer()
                    }
                    Divider()
                        .padding(5)
                    HStack{
                        VStack(alignment: .leading){
                            Text("Link")
                                .fontWeight(.semibold)
                            NavigationLink {
                                EditLinkView()
                            } label: {
                                Text("+ Add link")
                                    .foregroundStyle(colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.29))
                                    .padding(.top, 1)
                            }
                        }
                        Spacer()
                    }
                    Divider()
                        .padding(5)
                    Toggle(isOn: $badgeToggleIsOn) {
                        Text("Show instagram badge")
                        Text("When turned off, the Threads badge on your Instagram profile will also disapper.")
                    }
                    .tint(colorScheme == .light ? .black : .white)
                    Divider()
                        .padding(5)
                    Toggle(isOn: $privateToggleIsOn) {
                        Text("Private profile")
                        Text("If you switch to private, only followers can see your threads. Your replies will be visible to followers and individul profiles you reply to.")
                    }
                    .tint(colorScheme == .light ? .black : .white)
                    
                }
                .font(.system(size: 14))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Back"){dismiss()}
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done"){
                            Task{
                                try await viewModel.updateUserData()
                            }
                            dismiss()
                        }
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                }
                .toolbarBackground(colorScheme == .light ? .white : .mainBackground)
                .toolbarBackgroundVisibility(.visible)
                .navigationTitle("Edit profile")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
                .frame(width: 385, height: 385)
                .background(colorScheme == .light ? .white : .mainBackground)
                .clipShape(.rect(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                }
            }
        }
    }
}
#Preview {
    EditProfileView(user: User.MOCK_USER)
}
