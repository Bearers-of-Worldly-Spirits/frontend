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
    @Binding var fullname:String
    
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
                                                                
                        InfoPageView()
                        
                        Spacer()
                        
                        ButtonFill(title: "Login") {
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                            withAnimation {
                                activeSheet = .login
                            }
                        }
                        .padding()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .background(Color(.systemBackground).ignoresSafeArea())
            })
            
            switch activeSheet {
                case .login:
                    LoginView(fullname: $fullname)
                        .transition(.move(edge: .trailing))
                case .none:
                    EmptyView()                
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(fullname: .constant(""))
    }
}
