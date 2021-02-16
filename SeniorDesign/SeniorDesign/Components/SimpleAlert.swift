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
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color("Background"))
                .frame(maxWidth: 300, maxHeight: 170)
                .shadow(color: Color(.systemGray4), radius: 12)
                .transition(.scale)
            
            VStack(alignment: .center, spacing: 0) {
                
                Text(title)
                    .foregroundColor(Theme.primaryColor)
                    .font(Font.custom(Theme.fontName, size: 25, relativeTo: .title))
                    .fontWeight(.bold)
                    .padding()
                
                Text(message)
                    .foregroundColor(Color(.secondaryLabel))
                    .font(Font.custom(Theme.fontName, size: 15, relativeTo: .body))
                    .fontWeight(.medium)
                
                Spacer()
                                
                Divider()
                    .frame(maxWidth: 300)
                                                
                ButtonClear(title: "OK", action: action)
                
            }.frame(maxHeight: 170)
        }
    }
}

struct SimpleAlert_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAlert() {
            
        }
    }
}
