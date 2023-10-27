//
//  FeedView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("WallApp")
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("AAAAA")
                    }, label: {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
