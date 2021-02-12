//
//  SimpleButton.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/10/21.
//

import SwiftUI


struct ButtonFill: View {
    
    var title:String = "Click me!"
    
    var action: () -> Void
    
    var body: some View {
        Button(self.title) {action()}
        .padding()
        .frame(maxWidth: .infinity)
        .font(.title3)
        .background(Color(UIColor.primary))
        .foregroundColor(.white)
        .cornerRadius(8)
        .padding([.leading, .trailing], 40)
    }
}


struct ButtonLowKey: View {
    
    var title:String = "Click me!"
    
    var action: () -> Void
    
    var body: some View {
        Button(self.title) {action()}
        .padding()
        .frame(maxWidth: .infinity)
            .font(.callout)
            .background(Color.clear)
            .foregroundColor(Color(.tertiaryLabel))
        .cornerRadius(8)
        .padding([.leading, .trailing], 20)
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: .none, content: {
            Spacer()
            ButtonFill(title: "Signup") {
                
            }
            ButtonLowKey(title: "Already have an account?") {
                
            }
        })
    }
}
