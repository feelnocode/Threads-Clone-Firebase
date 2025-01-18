//
//  FeedView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.threads){thread in
                        ThreadRow(thread: thread)
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .background(.mainBackground)
        }
    }
}

#Preview {
    FeedView()
}
