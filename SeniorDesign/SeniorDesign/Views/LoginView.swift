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
        .dynamicFont(weight: .regular, scale: 3.0)
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
                        showSignup = true
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .onTapGesture { UIApplication.shared.endEditing() }                                                            
        }
        
        //TODO: Add this navigation to add state so it can inherit
        .fullScreenCover(isPresented: $showSignup, content: {
            SignupView()
                .environmentObject(userState)
        })
        
        .background(Color("Background").ignoresSafeArea())
    }
    
    func tryLogin() {
                
        userState.isLoading = true
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            userState.isLoading = false
            
            if (error == nil) {
                withAnimation {self.userState.authenticated = .yes}
            }else{
                userState.alertMessage = error?.localizedDescription ?? "Something went wrong!"
                userState.isShowingAlert = true                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
