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
        .font(Font.custom(Theme.fontName, size: 30, relativeTo: .title))
        .foregroundColor(Theme.primaryColor)
        .frame(height: 150)
    }
}


struct LoginView: View {
    
    @State private var showSignup:Bool = false
    @State private var isLoading:Bool = false
    @State private var isShowingAlert:Bool = false
    @State private var alertMessage:String = ""
    @AppStorage("email") private var username:String = ""
    @State private var password:String = ""    
    @EnvironmentObject var userState:UserState
    
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
            
            
            LoadingScreen(isLoading: $isLoading)
                        
            VStack {
                if isShowingAlert == true {
                    SimpleAlert(title: "Uh Oh.", message: alertMessage) {
                        isShowingAlert = false
                    }
                }
            }.transition(.opacity).animation(.easeInOut(duration: 0.25))
        }
        
        .fullScreenCover(isPresented: $showSignup, content: {
            SignupView()
                .environmentObject(userState)
        })
        
        .background(Color("Background").ignoresSafeArea())
    }
    
    func tryLogin() {
                
        isLoading = true
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            isLoading = false
            
            if (error == nil) {
                isShowingAlert = false
                withAnimation {self.userState.authenticated = .yes}
            }else{
                alertMessage = error?.localizedDescription ?? "Something went wrong!"
                isShowingAlert = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
