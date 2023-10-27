//
//  CircularProfileImageView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/26/23.
//

import SwiftUI

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
            case .xSmall:
                return 40
            case .small:
                return 48
            case .medium:
                return 64
            case .large:
                return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let user: User?
    let size : ProfileImageSize
    
    var body: some View {
        Image("profile-photo")
            .resizable()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
            .foregroundColor(Color(.systemGray4))
    }
}

#Preview {
    CircularProfileImageView(user: User.MockUsers[0], size: .large)
}
