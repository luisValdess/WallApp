//
//  FeedView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State var showUploadPost = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 5)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("WallApp")
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showUploadPost.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    })
                }
            }
        }
        .sheet(isPresented: $showUploadPost) {
            UploadPostView()
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    FeedView()
}
