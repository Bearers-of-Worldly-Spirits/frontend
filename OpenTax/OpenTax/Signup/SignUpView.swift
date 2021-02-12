//
//  SignUpView.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/10/21.
//

import SwiftUI
import Parse


struct SignUpView: View {
    
    @State var loggedIn:Bool = false
    @State var showLogin:Bool = false
    @State var loading:Bool = false
    @State var alertShowing:Bool = false
    @State var alertText:String = ""
    @State var email:String = ""
    @State var password:String = ""

    var body: some View {
        
        ZStack {
            
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: .none, content: {
                    Text("MELON").padding(40).font(.title).foregroundColor(Color(.primary))
                    CustomTextField(text: $email, placeholder: "Email")
                    CustomTextField(text: $password, placeholder: "Password", secure: true)
                    ButtonFill(title: "Signup") {
                        signupUser()
                    }
                    ButtonLowKey(title: "Already have an account? Login") {
                        showLogin = true
                    }
                    Spacer()
                })
            }
            .onTapGesture { self.hideKeyboard() }
                    
            .alert(isPresented: $alertShowing, content: {
                Alert(title: Text("Uh Oh"), message: Text(alertText), dismissButton: .default(Text("OK")))
            })
            
            if (loading == true) {
                LoadingIndicator()
                    .transition(.scale)
            }
        }
        
        .background(EmptyView().fullScreenCover(isPresented: $showLogin) { LoginView() }
           .background(EmptyView().fullScreenCover(isPresented: $loggedIn) { FormLibrary() }))
    }
    
    func signupUser() {
        let user = PFUser()
        user.username = self.email
        user.email = self.email
        user.password = self.password
        user[DatabaseKey.signupComplete] = false
        self.loading = true
            
        user.signUpInBackground { (success, error) in
                    
            if (error != nil) {
                alertText = error?.localizedDescription ?? "Something went wrong!"
                alertShowing = true
                self.loggedIn = false
            }else{
                alertShowing = false
                self.loggedIn = true
            }
            
            self.loading = false
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
