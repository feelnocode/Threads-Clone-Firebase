//
//  ThreadRow.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 13/01/2025.
//

import SwiftUI

struct ThreadRow: View {
    @Environment(\.colorScheme) var colorScheme
    let thread: Thread
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                CircleProfilePic(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(thread.user?.username ?? "")
                            .fontWeight(.semibold)
                        Text(thread.timeStamp.timestampString())
                            .opacity(0.5)
                        Spacer()
                        Button {
                            Task{
                                guard thread.ownerUid == UserService.shared.currentUser?.id else { return }
                                try await ThreadService.deleteThread(thread.id)
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Text(thread.caption)
                    HStack(spacing: 25){
                        if thread.likes > 0{
                            Text(String(thread.likes))
                                .offset(x: 15)
                                .opacity(0.5)
                        }
                        Button {
                        //
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            //
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button {
                            //
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    .padding(.top, 8)
                }
            }
            .font(.system(size: 14))
            Divider()
                .padding(.vertical, 12)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ThreadRow(thread: Thread.MOCK_THREAD)
}
