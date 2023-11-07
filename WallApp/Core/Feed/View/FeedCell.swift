//
//  FeedCell.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/26/23.
//

import SwiftUI

struct FeedCell: View {
    
    @ObservedObject var viewModel : FeedCellViewModel
    
    @State private var showComments = false
    @State var showAlert = false
    
    private var user: User? {
        return viewModel.user
    }
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    init(post: Post, user: User?) {
        self.viewModel = FeedCellViewModel(post: post, user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Divider()
            // Image + Username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post Image
            Text("\(post.caption)")
                .padding(.trailing, 8)
                .padding(.leading, 54)
            
            // Actions Buttons
            HStack(spacing: 16) {
                HStack(spacing: 3) {
                    Button {
                        handleLikeTapped()
                    } label: {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            .imageScale(.large)
                            .foregroundColor(didLike ? .red : .black)
                    }
                    
                    //Likes Label
                    if post.likes > 0 {
                        Text("\(post.likes)")
                            .font(.footnote)
                    }
                }
                
                Button {
                    handleCommentTapped()
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Spacer()
                
                Text(post.timestamp.timestampString())
                    .font(.footnote)
                    .padding(.trailing, 20)
                    .foregroundColor(.gray)
                
            }
            .padding(.leading, 10)
            .padding(.top, 4)
            .tint(.black)
            
            
        }
        .alert("Log In to Interact", isPresented: $showAlert, actions: {
            Button("OK"){}
        })
        .sheet(isPresented: $showComments) {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
        }
    }
    
     func handleCommentTapped() {
         if (user != nil) {
            showComments.toggle()
        } else {
            showAlert.toggle()
        }
    }
    
    private func handleLikeTapped() {
            Task {
                if didLike {
                    try await viewModel.unlike()
                } else {
                    try await viewModel.like()
                }
            }
        }
}

#Preview {
    FeedCell(post: Post.MockPost[0], user: User.MockUsers[0])
}
