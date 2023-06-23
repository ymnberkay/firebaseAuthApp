//
//  SecondScreen.swift
//  firebaseLogin
//
//  Created by Berkay Yaman on 21.06.2023.
//

import SwiftUI

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = MainVievModel()
    
    var body: some View {
        VStack {
            Text("Login successful")
                .padding()
                .font(.largeTitle)
            Button("Log out", action: {
                viewModel.logOut()
                if(!viewModel.isLoggedIn){
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .frame(width: 90.0, height: 40.0)
            .border(Color.red, width: 1)
            .padding()
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}

