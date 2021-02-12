//
//  FormLibrary.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/11/21.
//

import SwiftUI
import Parse


struct FormLibrary: View {
    
    @State var showSplash:Bool = false
    @State var userFinishedSignup:Bool = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Text("Form Library")
                ButtonFill(title: "Logout") {
                    PFUser.logOut()
                    updateUserState()
                }
            }
        }
        
        .onAppear {
            updateUserState()
        }
        
        .background(EmptyView().fullScreenCover(isPresented: $showSplash) { SplashView() }
           .background(EmptyView().fullScreenCover(isPresented: $userFinishedSignup) {
                Text("User needs to complete signup")
           }))
    }
    
    func updateUserState() {
        if (PFUser.current() == nil) {
            self.showSplash = true
            self.userFinishedSignup = false
        }else{
            self.showSplash = false
            if let val = PFUser.current()?.object(forKey: DatabaseKey.signupComplete) as? Bool {
                self.userFinishedSignup = val
            }
        }
    }
}

struct FormLibrary_Previews: PreviewProvider {
    static var previews: some View {
        FormLibrary()
    }
}
