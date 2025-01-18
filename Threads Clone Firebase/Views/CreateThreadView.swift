//
//  CreateThreadView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct CreateThreadView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State var viewModel = CreateThreadViewModel()
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircleProfilePic(user: user, size: .small)
                    VStack(alignment: .leading){
                        Text(user?.username ?? "\u{1F937}")
                        TextField("What's on your mind?", text: $viewModel.caption, axis: .vertical)
                    }
                    Spacer()
                    if !viewModel.caption.isEmpty{
                        Button{
                            viewModel.caption = ""
                        }label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post"){
                        Task {
                            try await viewModel.uploadThread()
                            dismiss()
                        }
                    }
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                        .opacity(viewModel.caption.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.caption.isEmpty)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateThreadView()
}
