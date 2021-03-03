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
    case form8843
    
    var id: Int {
        hashValue
    }
}


struct HomeView: View {
    
    @State var fullname:String = "User"
    
    @State fileprivate var modalView:ActiveSheet?
    
    @EnvironmentObject var userState:UserState
    
    
    var body: some View {
        
        ScrollView(showsIndicators:false) {
                              
            // Header
            Group {
                WelcomeHeader(name: $fullname)
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
                        if error == nil {
                            withAnimation {
                                userState.authenticated = .no
                            }
                        }
                    }                    
                }
                
                ButtonClear(title: "Need help? Contact us") {
                    //TODO
                }
            }
        }
        
        .onAppear() { loadUserData() }
        .background(Color("Background").ignoresSafeArea())
        .fullScreenCover(item: $modalView) { item in
            switch item {
            case .form8843:
                Form8843()
            }
        }
    }
    
    func loadUserData() {                                
        fullname = PFUser.current()?.object(forKey: "name") as? String ?? "User"
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
