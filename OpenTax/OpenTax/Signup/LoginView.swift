//
//  LoginView.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/10/21.
//

import SwiftUI
import Parse


struct LoginView: View {
    
    @State var loggedIn:Bool = false
    @State var showSignup:Bool = false
    @State var email:String = ""
    @State var password:String = ""
    @State var loading:Bool = false
    @State var alertShowing:Bool = false
    @State var alertText:String = ""
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: .none, content: {
                    Text("MELON").padding(40).font(.title).foregroundColor(Color(.primary))
                    CustomTextField(text: $email, placeholder: "Email")
                    CustomTextField(text: $password, placeholder: "Password", secure: true)
                    ButtonFill(title: "Login") {
                        loginUser()
                    }
                    ButtonLowKey(title: "Don't have an account? Signup") {
                        showSignup = true
                    }
                    Spacer()
                })
            }
            .onTapGesture { self.hideKeyboard() }
            
            if (loading == true) {
                LoadingIndicator()
                    .transition(.scale)
            }
        }
        .background(EmptyView().fullScreenCover(isPresented: $showSignup) { SignUpView() }
           .background(EmptyView().fullScreenCover(isPresented: $loggedIn) { FormLibrary() }))
        
        .alert(isPresented: $alertShowing, content: {
            Alert(title: Text("Uh Oh"), message: Text(alertText), dismissButton: .default(Text("OK")))
        })
    }
    
    func loginUser() {
        self.loading = true
        
        PFUser.logInWithUsername(inBackground: self.email, password: self.password) { (user, error) in
            
            self.loading = false
            
            if (error != nil) {
                alertText = error?.localizedDescription ?? "Something went wrong!"
                alertShowing = true
                self.loggedIn = false
            }else{
                alertShowing = false
                self.loggedIn = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
