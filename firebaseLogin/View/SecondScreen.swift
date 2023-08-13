//
//  SecondScreen.swift
//  firebaseLogin
//
//  Created by Berkay Yaman on 21.06.2023.
//

import SwiftUI

struct SecondScreen: View {
    @StateObject var viewModel = MainVievModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("", destination: FirstScreen(), isActive: $viewModel.isLoggedOut)
                    Text("Login successful")
                        .padding()
                        .font(.largeTitle)
                    Button("Log out", action: {
                        viewModel.logOut()
                    })
                    .frame(width: 90.0, height: 40.0)
                    .border(Color.red, width: 1)
                    .padding()
            }
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)

    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}

