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
        
        VStack(alignment: .center, spacing: 0) {
            
            Text(title)
                .foregroundColor(Theme.primaryColor)
                .font(Font.custom(Theme.fontName, size: 20))
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: Theme.maxScreenWidth)
            
            Text(message)
                .foregroundColor(Color(.secondaryLabel))
                .font(Font.custom(Theme.fontName, size: 15))
                .fontWeight(.medium)
            
            Spacer()
                            
            Divider()
                .frame(maxWidth: 300)
                                            
            ButtonClear(title: "OK", action: action)
            
        }
        .frame(maxWidth: Theme.maxScreenWidth, maxHeight: 170)
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color("Background"))
//                        .frame(maxWidth: Theme.maxScreenWidth, maxHeight: 170)
                        .shadow(color: Color(.systemGray4), radius: 12)
                        .transition(.scale))
    }
}

struct SimpleAlert_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAlert() {
            
        }
    }
}
