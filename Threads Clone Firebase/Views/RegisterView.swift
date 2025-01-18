//
//  RegisterView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegistrationViewModel()
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Spacer()
            Image("threads_logo")
                .interpolation(.high)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 140)
                .padding()
                .foregroundStyle(.red)
            VStack{
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(TextFieldLoginModifier())
                TextField("Enter your full name", text: $viewModel.name)
                    .modifier(TextFieldLoginModifier())
                TextField("Enter you email", text: $viewModel.email)
                    .modifier(TextFieldLoginModifier())
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldLoginModifier())
                SecureField("Repeat your password", text: $viewModel.repeatedPassword)
                    .modifier(TextFieldLoginModifier())
            }
            
            Button {
                Task{
                    try await viewModel.createUser()
                }
            } label: {
                Text("Sign Up")
                    .modifier(AuthButtonModifier())
                    .opacity(viewModel.isInputValid() ? 1 : 0.6)
            }
            .padding()
            
            .disabled(!viewModel.isInputValid())
            

            Spacer()
            Divider()
                .padding()
            Button {
                dismiss()
            } label: {
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.semibold)
            }
            .font(.system(size: 14))
            .foregroundStyle(colorScheme == .dark ? .white : .black)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.loginBackground, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    RegisterView()
}
