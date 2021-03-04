//
//  SplashView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/25/21.
//

import SwiftUI


private enum ActiveSheet: Identifiable {
    case login
    
    var id: Int {
        hashValue
    }
}


struct SplashView: View {
    
    @State fileprivate var activeSheet:ActiveSheet?
    @EnvironmentObject var userState:AppState
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                ScrollView {
                    VStack {
                        
                        Text("Melon")
                            .dynamicFont(scale: 3.0)
                            .padding()
                            .foregroundColor(Color("Primary"))
                            
                        
                        Text("Melon makes tax filing, simple.")
                            .dynamicFont(weight: .bold, scale: 1.0)
                            .foregroundColor(Color(.secondaryLabel))
                            .padding()
                            .multilineTextAlignment(.center)
                        
                                                 
                        Spacer()
                        
                        InfoPageView()
                            .padding(.bottom, 50)
                        
                        Spacer()
                        
                        ButtonFill(title: "Login") {                            
                            withAnimation {
                                activeSheet = .login
                            }
                        }
                        .padding(.bottom, 50)
                    }
                    .frame(minHeight: geometry.size.height)
//                    .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height)
//                    .frame(maxHeight: .infinity)
                }
                .background(Color(.systemBackground).ignoresSafeArea())
            })
            
            switch activeSheet {
                case .login:
                    LoginView()
                        .transition(.move(edge: .trailing))
                        .environmentObject(userState)
                case .none:
                    EmptyView()                
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
