//
//  FirebaseOperation.swift
//  firebaseLogin
//
//  Created by Berkay Yaman on 2.05.2023.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

extension FirstScreen {
    @MainActor class MainVievModel: ObservableObject {
        @Published var user = User(userName: "", password: "")
        @Published var isLoggedIn = false
        
        func login(){
            DispatchQueue.main.async {
                Auth.auth().signIn(withEmail: self.user.userName, password: self.user.password) {(result, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "Errorrr.")
                        self.user.userName = ""
                        self.user.password = ""
                    }
                    else {
                        self.isLoggedIn = true
                        print(self.isLoggedIn)
                    }
                }
            }
        }
        
        
        func signUp() {
            DispatchQueue.main.async {
                Auth.auth().createUser(withEmail: self.user.userName, password: self.user.password, completion: { result, err in
                    if let err = err {
                        print("Failed due to error:", err)
                        return
                    }
                    print("Successfully created account with ID: \(result?.user.uid ?? "")")
                })
            }
            
        }
        
        func logOut(){
            DispatchQueue.main.async {
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                
                
            }
        }
    }
}

