//
//  SignupView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse


struct SignupView: View {
                        
    @State var firstLast:String = ""
    @AppStorage("email") var username:String = ""
    @State var password:String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userState:AppState
    
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
        }
                
        .background(Color("Background").ignoresSafeArea())
    }
    
    func signupUser() {
        
        guard firstLast.count > 0 else {
            userState.alertMessage = "Please enter your first & last name."
            userState.isShowingAlert = true            
            return
        }
        
        let user = PFUser()
        user.username = username
        user.email = username
        user.password = password
        user["name"] = firstLast
        
        userState.isLoading = true
        
        user.signUpInBackground { (success, error) in
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
