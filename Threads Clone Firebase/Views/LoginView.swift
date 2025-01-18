//
//  LoginView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("threads_logo")
                    .interpolation(.high)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 140)
                    .padding()
                VStack{
                    TextField("Enter you email", text: $viewModel.email)
                        .modifier(TextFieldLoginModifier())
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TextFieldLoginModifier())
                }
                
                NavigationLink {
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .fontWeight(.semibold)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 13))
                }
                .padding(.leading, 228)
                .padding(.top, 2)
                
                Button {
                    Task{
                        try await viewModel.login()
                    }
                } label: {
                    Text("Login")
                        .modifier(AuthButtonModifier())
                }
                .disabled(!viewModel.checkValidity())
                .opacity(viewModel.checkValidity() ? 1 : 0.5)
                .padding()

                Spacer()
                Divider()
                    .padding()
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("New here?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.system(size: 14))
                .foregroundStyle(colorScheme == .dark ? .white : .black)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.loginBackground, ignoresSafeAreaEdges: .all)
        }
    }
}

#Preview {
    LoginView()
}
