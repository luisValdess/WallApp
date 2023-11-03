//
//  FeedView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

struct FeedView: View {
    

    init(user: User?) {
        self._viewModel = StateObject(wrappedValue: FeedViewModel(user: user))
    }
    
    private var user: User? {
        return viewModel.user
    }
    
    @StateObject var viewModel : FeedViewModel
    
    @State var showUploadPost = false
    @State var showAlert = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post, user: user)
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
                        postPermisionHandler()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    })
                }
            }
        }
        .alert("Log In to Publish", isPresented: $showAlert, actions: {
            Button("OK"){}
        })
        .sheet(isPresented: $showUploadPost) {
            UploadPostView()
                .presentationDragIndicator(.visible)
        }
    }
    
    private func postPermisionHandler() {
        if (user != nil) {
            showUploadPost.toggle()
        } else {
            showAlert.toggle()
        }
    }
}

#Preview {
    FeedView(user: User.MockUsers[0])
}
