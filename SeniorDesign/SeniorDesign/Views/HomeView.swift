//
//  HomeView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Combine
import Parse


struct HomeView: View {
    
    @ObservedObject var userData:User = User()
    @State private var userNeedsLogin:Bool = false
    
    var body: some View {
        
        ScrollView {
                                    
            WelcomeHeader(name: $userData.fullname)
            
            Divider().padding(30)
            
            TaxFormCarousel { (formName) in }
            
            Divider().padding(30)
            
            ComingSoonTaxFormCarousel { (formName) in }
            
            Divider().padding(30)
                                    
            ButtonFill(title: "Logout") {
                PFUser.logOutInBackground { (error) in
                    loginIfNeeded()}}
        }
        .onAppear() { loginIfNeeded() }
        .fullScreenCover(isPresented: $userNeedsLogin, content: {
            LoginView(fullname: $userData.fullname)})
        .background(Color("Background").ignoresSafeArea())
    }
    
    func loginIfNeeded() {
        if (PFUser.current() == nil) {
            userNeedsLogin = true
        }else{
            userNeedsLogin = false
            userData.fullname = PFUser.current()?.object(forKey: "name") as? String ?? "User"
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
