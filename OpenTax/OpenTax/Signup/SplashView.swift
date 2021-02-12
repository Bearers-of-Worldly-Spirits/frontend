//
//  SplashView.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/10/21.
//

import SwiftUI


enum SplashState {
    case none
    case login
    case signup
}


struct SplashView: View {
    
    @State var showLogin:Bool = false
    @State var showSignup:Bool = false
    
    var body: some View {
        GeometryReader(content: { gr in
            ScrollView {
                VStack {
                    Text("MELON").padding(40).font(.title).foregroundColor(Color(.primary))
                    Text("Content coming soon").foregroundColor(Color(.tertiaryLabel))
                    Spacer()
                    ButtonFill(title: "Login") {
                        showLogin = true
                    }
                    ButtonLowKey(title: "Don't have an account? Signup") {
                        showSignup = true
                    }
                }.frame(width: gr.size.width, height: gr.size.height, alignment: .center)
            }
        })
                

        .background(EmptyView().fullScreenCover(isPresented: $showLogin) { LoginView() }
           .background(EmptyView().fullScreenCover(isPresented: $showSignup) { SignUpView() }))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewDevice("iPhone 12")
    }
}
