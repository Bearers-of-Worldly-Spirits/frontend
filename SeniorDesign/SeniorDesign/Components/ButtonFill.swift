//
//  ButtonFill.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct ButtonFill: View {
    var title:String = "Login"
    
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            action()
        }) {
            Text(title)
                .dynamicFont(min: 15, step: 0.75, weight: .medium, design: .rounded)
                .frame(maxWidth: Theme.maxScreenWidth)
            .padding()
            .foregroundColor(Color("Background"))
            .background(
                RoundedRectangle(cornerRadius: Theme.cornerRadius)
                    .fill(Theme.primaryColor))
        }
        .shadow(radius: 7.0)
        .frame(maxWidth: Theme.maxScreenWidth)
    }
}

struct ButtonFill_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFill() {
            
        }
    }
}
