//
//  PrivacyView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 4/21/21.
//

import SwiftUI

struct PrivacyView: View {
    
    @EnvironmentObject var appState:AppState
    
    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            
            Text("Your Privacy")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding()
            
            
            
            ScrollView {
                Text(
"""
As Melon is designed to help you with your taxes, we optionally ask you for sensitive information.

1) This information is completely optional, and you can skip over any information you are not comfortable giving.

2) We only store your name and email address. We use this information strictly for authentication purposes. We do not sell your information.

3) Additional information provided is stored locally, on your device only (we cannot access it) and it is stored securely using Apple Keychain.

4) Our app is open-source, and all of our source-code and be viewed at github.com/Bearers-of-Worldly-Spirits/main_app

5) Please visit our website for further inquiries: https://melontaxapp.herokuapp.com/
"""
                )
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .frame(width: Theme.maxScreenWidth)
                .padding()
            }
            
            ButtonFill(title: "Got it!") {
                appState.currentScreen = .home
            }
        })
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
