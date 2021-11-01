//
//  Instragram_CloneApp.swift
//  Instragram-Clone
//
//  Created by Chanoknun Choosaksilp on 11/10/2564 BE.
//

import SwiftUI
import Firebase
@main
struct Instragram_CloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
