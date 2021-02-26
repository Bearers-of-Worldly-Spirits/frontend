//
//  HomeView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Combine
import Parse


private enum ActiveSheet: Identifiable {
    case login, form8843
    
    var id: Int {
        hashValue
    }
}


struct HomeView: View {
    
    @ObservedObject var userData:User = User()
    
    @State fileprivate var modalView:ActiveSheet? = .login
    
    
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
                        modalView = .form8843
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
        .background(Color("Background").ignoresSafeArea())
        .fullScreenCover(item: $modalView) { item in
            switch item {
            case .login:
                SplashView(fullname: $userData.fullname)
//                LoginView(fullname: $userData.fullname)
            case .form8843:
                Form8843()
            }
        }
    }
    
    func loginIfNeeded() {
        if (PFUser.current() == nil) {
            modalView = .login
        }else{
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
