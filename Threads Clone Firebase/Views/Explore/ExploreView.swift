//
//  ExploreView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    @State var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){user in
                        NavigationLink(value: user){
                            VStack{
                                UserRow(user: user)
                                Divider()
                                    .frame(width: 275)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .scrollIndicators(.hidden)
            .background(.mainBackground)
        }
    }
}

#Preview {
    ExploreView()
}
