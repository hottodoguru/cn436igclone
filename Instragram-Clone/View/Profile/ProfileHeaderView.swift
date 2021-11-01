//
//  ProfileHeader.swift
//  Instragram-Clone
//
//  Created by Chanoknun Choosaksilp on 12/10/2564 BE.
//

import SwiftUI
import Kingfisher
struct ProfileHeaderView: View {
    @ObservedObject var ViewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    
    @State var imagePickerPresented = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                ZStack{
                        Button {
                            imagePickerPresented.toggle()
                        } label:{
                            if let imageURL = ViewModel.user.profileImageURL {
                                KFImage(URL(string: imageURL))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.leading,16)
                            } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizeTo(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                            }
                        }
                        .sheet(isPresented: $imagePickerPresented){
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        
                    }
                }
                
            
                Spacer()
                
                HStack(spacing: 16){
                    UserStatView(value: ViewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: ViewModel.user.stats?.followers ?? 0, title: "Follower")
                    UserStatView(value: ViewModel.user.stats?.following ?? 0, title: "Following")
                }
                .padding(.trailing, 32)
            }
            Text(ViewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            HStack {
                Spacer()
                ProfileButtonView(viewModel: ViewModel)
                Spacer()
            }
            .padding(.top)
        }
    }
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        ViewModel.changeProfileImage(image: selectedImage)
    }
}
