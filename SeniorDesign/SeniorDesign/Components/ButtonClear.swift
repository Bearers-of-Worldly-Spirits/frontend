//
//  ButtonClear.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct ButtonClear: View {
    var title:String = "Don't have an account? Signup"
    
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .dynamicFont(weight: .medium, scale: 1.0)
                .multilineTextAlignment(.center)
            .foregroundColor(Color(.tertiaryLabel))
            .padding()
            .frame(maxWidth: Theme.maxScreenWidth)
        }
    }
}

struct ButtonClear_Previews: PreviewProvider {
    static var previews: some View {
        ButtonClear() {
            
        }
    }
}
