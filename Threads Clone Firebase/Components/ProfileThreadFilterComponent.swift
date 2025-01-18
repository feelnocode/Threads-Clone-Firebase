//
//  ProfileThreadFilterComponent.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 16/01/2025.
//

import SwiftUI

struct ProfileThreadFilterComponent: View {
    @State var viewModel: ProfileThreadFilterViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User){
        self._viewModel = State(wrappedValue: ProfileThreadFilterViewModel(user: user))
    }
    
    //TODO: add filtering
    
    var body: some View {
        HStack{
            ForEach(ProfileThreadFilter.allCases){ filter in
                VStack{
                    Text(filter.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                    
                    if selectedFilter == filter {
                        Rectangle()
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            .frame(width: filterBarWidth, height: 1)
                            .matchedGeometryEffect(id: "item", in: animation)
                    } else {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(width: filterBarWidth, height: 1)
                    }
                }
                .onTapGesture {
                    withAnimation(.spring(duration: 0.3)){
                        selectedFilter = filter
                    }
                }
            }
        }
        .onAppear {
            Task{
                try await viewModel.fetchUserThreads()
            }
        }
        Divider().offset(y: -8)
        LazyVStack{
            ForEach(viewModel.threads){thread in
                ThreadRow(thread: thread)
            }
        }
    }
}

#Preview {
    ProfileThreadFilterComponent(user: User.MOCK_USER)
}
