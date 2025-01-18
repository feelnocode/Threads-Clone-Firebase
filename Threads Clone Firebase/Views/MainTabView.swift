//
//  MainTabView.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct MainTabView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingCreateThread = false
    var body: some View {
        TabView{
            Tab {
                FeedView()
            } label: {
                Image(systemName: "house")
            }
            Tab {
                ExploreView()
            } label: {
                Image(systemName: "magnifyingglass")
            }
            Tab {
                EmptyView()
            } label: {
                //
            }
            Tab {
                ActivityView()
            } label: {
                Image(systemName: "heart")
            }
            Tab {
                CurrentUserProfileView()
            } label: {
                Image(systemName: "person")
            }
            
        }
        .overlay(alignment: .bottom, content: {
            Button {
                showingCreateThread.toggle()
            } label: {
                ZStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.9))
                            .frame(width: 40, height: 30)
                        Image(systemName: "plus")
                            .bold()
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .offset(y: -7)
                }
                .frame(width: 95, height: 45)
                
            }
            .sensoryFeedback(.success, trigger: showingCreateThread){trigger, _ in
                trigger != true
            }
        })
        .sheet(isPresented: $showingCreateThread, content: {
            CreateThreadView()
        })
        .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    MainTabView()
}
