//
//  SimpleAlert.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct SimpleAlert: View {
    
    var title:String = "Uh Oh."
    var message:String = "Something went wrong!"
    var action: () -> ()
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color(UIColor(white: 0, alpha: 0.3)))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        
            VStack(alignment: .center, spacing: 0) {
                
                Spacer()
                
                Text(title)
                    .foregroundColor(Theme.primaryColor)
                    .dynamicFont(weight: .bold, scale: 0.95)
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                
                Text(message)
                    .foregroundColor(Color(.secondaryLabel))
                    .dynamicFont(weight: .regular, scale: 0.85)
                    .lineLimit(4)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                
                Spacer()
                                
                Divider()
                                                
                ButtonClear(title: "OK", action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    action()
                })
                
            }
            .frame(maxWidth: Theme.maxScreenWidth, maxHeight: 250)
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("Background"))
                            .shadow(color: Color(.systemGray4), radius: 12)
                            .transition(.scale))
        }
        .ignoresSafeArea()
    }
}

struct SimpleAlert_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAlert() {
            
        }
    }
}
