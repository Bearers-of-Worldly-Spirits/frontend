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
    
    @Binding var fullname:String
    
    @State private var showSignup:Bool = false
    @State private var isLoading:Bool = false
    @State private var isShowingAlert:Bool = false
    @State private var alertMessage:String = ""
    @State private var username:String = ""
    @State private var password:String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
                            
            ScrollView {
                
                VStack {
                    Title()
                    
                    VStack(spacing: 0) {
                        SimpleTextfield(text: $username, placeholder: "Email")
                        SimpleTextfield(text: $password, placeholder: "Password", secure: true)
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
            
            
            ActivityIndicatorView(isVisible: $isLoading, type: .arcs)
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(Theme.primaryColor)
            
            
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
        })
        
        .background(Color("Background").ignoresSafeArea())
    }
    
    func tryLogin() {
                
        isLoading = true
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            isLoading = false
            
            if (error == nil) {
                isShowingAlert = false
                fullname = user?.object(forKey: "name") as? String ?? "User"
                presentationMode.wrappedValue.dismiss()
            }else{
                alertMessage = error?.localizedDescription ?? "Something went wrong!"
                isShowingAlert = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(fullname: .constant("Steve Jobs"))
    }
}
