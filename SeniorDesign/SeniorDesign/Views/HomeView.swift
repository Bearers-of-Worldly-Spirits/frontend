//
//  HomeView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Combine
import Parse


enum DisplayedView {
    case login
    case form8843
}


struct HomeView: View {
    
    @ObservedObject var userData:User = User()
    @State private var showModalView:Bool = false
    @State private var modalView:DisplayedView = .login
    
    
    var body: some View {
        
        ScrollView(showsIndicators:false) {
                              
            // Header
            Group {
                WelcomeHeader(name: $userData.fullname)
                LargeGradientCard(
                    title: "Welcome back! Your tax forms are due in 129 days.",
                    gradient: Gradient(colors: [Color.purple, Color.pink])
                ).frame(maxWidth: Theme.maxScreenWidth)
                Spacer(minLength: 30)
            }
            
            // Form data
            Group {
                Divider()
                TaxFormCarousel { (form) in
                    if form.name == "Form 8843" {
                        modalView = DisplayedView.form8843
                        showModalView = true
                    }
                }
                Divider()
                ComingSoonTaxFormCarousel { (formName) in }
            }
            
            // Logout & help
            Group {
                Divider()
                Spacer(minLength: 30)
                ButtonFill(title: "Logout") {
                    PFUser.logOutInBackground { (error) in
                        loginIfNeeded()}}
                ButtonClear(title: "Need help? Contact us") {
                    //TODO
                }
            }
        }
        
        .onAppear() { loginIfNeeded() }
        .fullScreenCover(isPresented: $showModalView, content: {
            if modalView == .login { LoginView(fullname: $userData.fullname)}
            if modalView == .form8843 { Form8843() }
        })
        .background(Color("Background").ignoresSafeArea())
    }
    
    func loginIfNeeded() {
        if (PFUser.current() == nil) {
            modalView = DisplayedView.login
            showModalView = true
        }else{
            modalView = DisplayedView.form8843
            showModalView = false
            userData.fullname = PFUser.current()?.object(forKey: "name") as? String ?? "User"
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
