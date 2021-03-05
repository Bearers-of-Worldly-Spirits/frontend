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
    
    
    @EnvironmentObject var userState:AppState
    @State var fullname:String = "User"
    
    
    var body: some View {
        
        ScrollView(showsIndicators:false) {
                              
            // Header
            Group {
                WelcomeHeader(name: $fullname)
                LargeGradientCard(
                    title: "Welcome back! Your tax forms are due in 129 days.",
                    gradient: Gradient(colors: [Color.purple, Color.pink])
                )
                .padding()
                //.frame(maxWidth: Theme.maxScreenWidth)
                Spacer(minLength: 30)
            }
            
            // Join the discussion!
            Group {
                Divider()
                DiscussionCarousel {
                                        
                }
                
            }
            
            // Form data
            Group {
                Divider()
                TaxFormCarousel { (form) in
                    if form.name == "Form 8843" {
                        userState.currentScreen = .form8843
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
                    logoutUser()
                }
                
                ButtonClear(title: "Need help? Contact us") {
                    //TODO
                }
            }
        }
        
        .onAppear() { loadUserData() }
        .background(Color("Background").ignoresSafeArea())
    }
    
    func logoutUser() {
        userState.isLoading = true
        PFUser.logOutInBackground { (error) in
            userState.isLoading = false
            if error == nil {
                withAnimation {
                    userState.currentScreen = .splash
                }
            }else{
                userState.alertMessage = error?.localizedDescription ?? "Something went wrong!"
                userState.isShowingAlert = true
            }
        }  
    }
    
    func loadUserData() {                                
        fullname = PFUser.current()?.object(forKey: "name") as? String ?? "User"
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ContentSizeCategory.extraSmall, ContentSizeCategory.accessibilityExtraExtraExtraLarge], id: \.self) { size in
            Group {
                HomeView()
                    .previewDevice("iPhone SE (2nd generation)")
                HomeView()
                    .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            }
            .environment(\.sizeCategory, size)
        }
    }
}
