//
//  ContentView.swift
//  firebaseLogin
//
//  Created by Berkay Yaman on 2.05.2023.
//

import SwiftUI

struct FirstScreen: View {
    @StateObject var viewModel = MainVievModel()
    var body: some View {
        VStack {
            Text("Firebase Login app")
                .padding()
            //MARK: -user name text field
            TextField("Enter user name", text: $viewModel.user.userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300.0, height: 10.0)
                .padding()
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            //MARK: -password secure field
            SecureField("Enter password", text: $viewModel.user.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300.0, height: 10.0)
                .padding()
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            //MARK: -Buttons
            HStack {
                Button("Login", action: {
                    viewModel.login()
                })
                .frame(width: 90.0, height: 40.0)
                .border(Color.red, width: 1)
                .padding()
                
                
                Button("Sign up", action: {
                    viewModel.signUp()
                    
                })
                .frame(width: 90.0, height: 40.0)
                .border(Color.red, width: 1)
                .padding()
                
                Button("Log out", action: {
                    viewModel.logOut()
                })
                .frame(width: 90.0, height: 40.0)
                .border(Color.red, width: 1)
                .padding()
                
            }.padding()
            Text("Login State: \(String(viewModel.isLoggedIn))")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}

