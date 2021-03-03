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
    @EnvironmentObject var userState:UserState
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                ScrollView {
                    VStack {
                        
                        Text("Melon")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .padding()
                            .foregroundColor(Color("Primary"))
                        
                        Text("Melon makes tax filing, simple.")
                            .font(Font.system(.body))
                            .foregroundColor(Color(.secondaryLabel))
                            .padding()
                                                 
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
                    .frame(width: geometry.size.width, height: geometry.size.height)
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
