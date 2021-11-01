//
//  User.swift
//  Instragram-Clone
//
//  Created by Chanoknun Choosaksilp on 18/10/2564 BE.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    let fullname: String
    var profileImageURL : String?
    @DocumentID var id: String?
    var stats : UserStatsData?
    
    mutating func updateProfileImageURL(url : String) {
        profileImageURL = url
    }
    
    var isCurrentUse:Bool {
        AuthViewModel.shared.userSession?.uid == id
    }
    
    var didFollow: Bool? = false
}

struct UserStatsData : Decodable {
    var following: Int
    var followers: Int
    var posts: Int
}
