//
//  SplashView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/25/21.
//

import SwiftUI


struct SplashView: View {
        
    @EnvironmentObject var userState:AppState
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                ScrollView {
                    VStack {
                        
                        Text("Melon")
                            .scaledFont(size: 50, name: Theme.font.medium)
                            .padding()
                            .foregroundColor(Color("Primary"))
                            
                        
                        Text("Melon makes tax filing, simple.")                            
                            .scaledFont(size: 16, name: Theme.font.medium)
                            .foregroundColor(Color(.secondaryLabel))
                            .padding()
                            .multilineTextAlignment(.center)
                        
                                                 
                        Spacer()
                        
                        InfoPageView()
                            .padding(.bottom, 50)
                        
                        Spacer()
                        
                        ButtonFill(title: "Login") {                            
                            withAnimation {
                                userState.currentScreen = .login
                            }
                        }
                        .padding(.bottom, 50)
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .background(Color(.systemBackground).ignoresSafeArea())
            })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach([ContentSizeCategory.extraSmall, ContentSizeCategory.accessibilityExtraExtraExtraLarge], id: \.self) { size in
            Group {
                SplashView()
                    .previewDevice("iPhone SE (2nd generation)")
                SplashView()
                    .previewDevice("iPad Pro (12.9-inch) (4th generation)")
            }
            .environment(\.sizeCategory, size)
        }
        
    }
}
