//
//  WelcomeHeader.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct WelcomeHeader: View {
    
    @Binding var name:String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Hello " + name)
                    .font(Font.custom(Theme.fontName, size: 16))
                    .fontWeight(.medium)
                
                HStack {
                    Text("Your Tax")
                        .foregroundColor(Color(.label))
                        .font(.custom(Theme.fontName, size: 27, relativeTo: .title))
                        .fontWeight(.bold)
                    Text("Report")
                        .font(.custom(Theme.fontName, size: 27, relativeTo: .title))
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
        }
        .foregroundColor(Theme.primaryColor)
        .accentColor(Theme.primaryColor)
        .padding()
    }
}

struct WelcomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHeader(name: .constant("Josh"))
    }
}
