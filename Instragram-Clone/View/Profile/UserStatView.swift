//
//  UserStat.swift
//  Instragram-Clone
//
//  Created by Chanoknun Choosaksilp on 12/10/2564 BE.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15,weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }
        .frame(width: 80, alignment: .center)
    }
}


