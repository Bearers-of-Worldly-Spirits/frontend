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
                    .scaledFont(size: 16, name: Theme.font.medium)
                
                HStack(spacing: 5) {
                    Text("Your Tax")
                        .foregroundColor(Color(.label))
                        .scaledFont(size: 20, name: Theme.font.medium)
                    Text("Report")
                        .scaledFont(size: 20, name: Theme.font.bold)                        
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
