//
//  SignupView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse
import ActivityIndicatorView


struct SignupView: View {
    
    @State var userSignedUp:Bool = false
    @State var isLoading:Bool = false
    @State var isShowingAlert:Bool = false
    @State var alertMessage:String = ""
    @State var firstLast:String = ""
    @State var username:String = ""
    @State var password:String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
        
            ScrollView {
                VStack {
                    
                    Text("Signup")
                        .font(Font.custom(Theme.fontName, size: 30, relativeTo: .title))
                        .foregroundColor(Theme.primaryColor)
                        .frame(height: 150)
                    
                    VStack(spacing: 0) {
                        SimpleTextfield(text: $firstLast, placeholder: "First Last")
                        SimpleTextfield(text: $username, placeholder: "Email")
                        SimpleTextfield(text: $password, placeholder: "Password", secure: true)
                    }
                    
                    Spacer(minLength: 50)
                                    
                    ButtonFill(title: "Signup") {
                        UIApplication.shared.endEditing()
                        signupUser()
                    }
                    
                    ButtonClear(title: "Have an account? Login") {
                        UIApplication.shared.endEditing()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            
            ActivityIndicatorView(isVisible: $isLoading, type: .arcs)
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(Theme.primaryColor)
            
            VStack {
                if isShowingAlert == true {
                    SimpleAlert(title: "Uh Oh.", message: alertMessage) {
                        isShowingAlert = false
                    }
                }
            }.transition(.opacity).animation(.easeInOut(duration: 0.2))
        }
        
        .fullScreenCover(isPresented: $userSignedUp, content: {
            HomeView()
        })
        
        .background(Color("Background").ignoresSafeArea())
    }
    
    func signupUser() {
        
        guard firstLast.count > 0 else {
            alertMessage = "Please enter your first & last name."
            isShowingAlert = true
            return
        }
        
        let user = PFUser()
        user.username = username
        user.email = username
        user.password = password
        user["name"] = firstLast
        
        isLoading = true
        
        user.signUpInBackground { (success, error) in
            isLoading = false
            
            if (error == nil) {
                isShowingAlert = false
                userSignedUp = true                
            }else{
                alertMessage = error?.localizedDescription ?? "Something went wrong!"
                isShowingAlert = true
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
