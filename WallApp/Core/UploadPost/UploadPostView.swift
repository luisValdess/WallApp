//
//  UploadPostView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/28/23.
//

import SwiftUI

struct UploadPostView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var text = ""
    @StateObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack {
                        CircularProfileImageView(user: User.MockUsers[0], size: .xSmall)
                            .padding(.leading, 8)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            print("There is no other option. ")
                        }, label: {
                            HStack {
                                Text("Public")
                                Image(systemName: "chevron.down")
                                    .padding(.top, 1)
                            }
                            .frame(alignment: .leading)
                            .fontWeight(.medium)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 4)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke()
                            })
                            
                        })
                        .padding(.top, 7)
                        
                        TextField("Write a message", text: $text, axis: .vertical)
                            .padding(.top, 8)
                            .padding(.trailing, 8)
                        
                    }
                }
                .padding(.top)
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Cancel")
                        .onTapGesture {
                            dismiss()
                        }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            try await viewModel.uploadPost(caption: text)
                            clearPostDataAndReturnToFeed()
                            dismiss()
                        }
                    }, label: {
                        Text("Post")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.vertical, 6)
                            .padding(.horizontal)
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                            }
                    })
                }
            }
            .tint(.blue)
        }
    }
    
    func clearPostDataAndReturnToFeed() {
        text = ""
    }
}



#Preview {
    UploadPostView()
}
