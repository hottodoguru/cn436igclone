//
//  ProfileButtonView.swift
//  Instragram-Clone
//
//  Created by Chanoknun Choosaksilp on 18/10/2564 BE.
//

import SwiftUI

struct ProfileButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    var didFollow: Bool {
        viewModel.user.didFollow ?? false
    }
    var body: some View {
        if viewModel.user.isCurrentUse {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14 , weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        } else {
            HStack(spacing: 16){
                Button {
                    didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(didFollow ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(didFollow ? .black : .white)
                        .background(didFollow ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: didFollow ? 1: 0)
                        )
                }
                .cornerRadius(3)
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14 , weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

