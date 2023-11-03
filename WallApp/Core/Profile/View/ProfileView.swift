//
//  ProfileView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/29/23.
//

import SwiftUI

struct ProfileView: View {
    
        @StateObject var viewModel: ProfileViewModel

        init(user: User?) {
            self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
        }
        
        private var user: User? {
            return viewModel.user
        }
    
        private var mainTitle: String {
            if (user != nil) {
                return "Be a Guest"
            } else {
                return "Join with an account"
            }
        }
        
        private var buttonTitle: String {
            if (user != nil) {
                return "Sign Out"
            } else {
                return "Set Account"
            }
        }
    
        private var image: String {
            if (user != nil) {
                return "log-out"
            } else {
                return "create-account"
            }
        }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image(image)
                    .resizable()
                    .frame(width: 400, height: 400)
                
                Spacer()
                
                Button(action: {
                    viewModel.handleProfileButton()
                }, label: {
                    Text(buttonTitle)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.black, lineWidth: 1)
                        }
                        .padding(.bottom, 70)
                })
                
            }
            .navigationTitle(mainTitle)
        }
    }
}

#Preview {
    ProfileView(user: User.MockUsers[0])
}
