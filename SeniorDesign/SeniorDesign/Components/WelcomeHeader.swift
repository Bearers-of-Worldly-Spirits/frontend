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
                    .dynamicFont(min: 16, step: 0.5, weight: .medium)
                
                HStack {
                    Text("Your Tax")
                        .foregroundColor(Color(.label))
                        .dynamicFont(min: 20, step: 0.5, weight: .semibold)
                    Text("Report")
                        .dynamicFont(min: 20, step: 0.5, weight: .bold)
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
