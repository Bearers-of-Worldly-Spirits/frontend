//
//  LoginView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse
import ActivityIndicatorView


private struct Title : View {
    var body : some View {
        HStack(alignment: .center, spacing: 4) {
            Text("Melon")                
        }    
        .scaledFont(size: 50, name: Theme.font.medium)
        .foregroundColor(Theme.primaryColor)
        .frame(height: 150)
    }
}


struct LoginView: View {
    
    @State private var showSignup:Bool = false    
    @AppStorage("email") private var username:String = ""
    @State private var password:String = ""    
    @EnvironmentObject var userState:AppState
    
    var body: some View {
        
        ZStack {
                            
            ScrollView {
                
                VStack {
                                                            
                    Title()
                    
                    VStack(spacing: 0) {
                        SimpleTextfield(text: $username, systemImageName: "envelope.fill", placeholder: "Email", keyboardType: .emailAddress)
                        SimpleTextfield(text: $password, systemImageName: "lock.fill", placeholder: "Password", secure: true)
                    }
                    
                    Spacer(minLength: 50)
                                    
                    ButtonFill(title: "Login") {
                        UIApplication.shared.endEditing()
                        tryLogin()
                    }
                    
                    ButtonClear(title: "Don't have an account? Signup") {
                        UIApplication.shared.endEditing()
                        userState.currentScreen = .signup
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .onTapGesture { UIApplication.shared.endEditing() }                                                            
        }
        .background(Color("Background").ignoresSafeArea())
    }
    
    func tryLogin() {
                
        userState.isLoading = true
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            userState.isLoading = false
            
            if (error == nil) {
                withAnimation {self.userState.currentScreen = AppView.home}
            }else{
                userState.alertMessage = error?.localizedDescription ?? "Something went wrong!"
                userState.isShowingAlert = true                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach([ContentSizeCategory.extraSmall, ContentSizeCategory.accessibilityExtraExtraExtraLarge], id: \.self) { size in
            Group {
                LoginView()
                    .previewDevice("iPhone SE (2nd generation)")
                LoginView()
                    .previewDevice("iPhone 12")
                LoginView()
                    .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            }
            .environment(\.sizeCategory, size)
        }
    }
}
