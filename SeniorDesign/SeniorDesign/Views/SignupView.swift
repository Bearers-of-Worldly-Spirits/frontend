//
//  SignupView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse


struct SignupView: View {
    
    static let userNameKey = "email"
        
    @State var isLoading:Bool = false
    @State var isShowingAlert:Bool = false
    @State var alertMessage:String = ""
    @State var firstLast:String = ""
    @AppStorage("email") var username:String = ""
    @State var password:String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userState:UserState
    
    var body: some View {
        
        ZStack {
        
            ScrollView {
                VStack {
                    
                    Text("Signup")
                        .font(Font.custom(Theme.fontName, size: 30, relativeTo: .title))
                        .foregroundColor(Theme.primaryColor)
                        .frame(height: 150)
                    
                    VStack(spacing: 0) {
                        SimpleTextfield(text: $firstLast, systemImageName: "person.fill", placeholder: "First Last", capitalize: .words)
                        SimpleTextfield(text: $username, systemImageName: "envelope.fill", placeholder: "Email", keyboardType: .emailAddress)
                        SimpleTextfield(text: $password, systemImageName: "lock.fill", placeholder: "Password", secure: true)
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
            
            LoadingScreen(isLoading: $isLoading)
            
            VStack {
                if isShowingAlert == true {
                    SimpleAlert(title: "Uh Oh.", message: alertMessage) {
                        isShowingAlert = false
                    }
                }
            }.transition(.opacity).animation(.easeInOut(duration: 0.2))
        }
                
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
                withAnimation {self.userState.authenticated = .yes}                
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
