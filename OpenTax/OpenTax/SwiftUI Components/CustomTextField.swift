//
//  CustomTextField.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/10/21.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text:String
    var placeholder:String = "Placeholder"
    var secure:Bool = false
    
    var body: some View {
        Group {
            if secure {
                SecureField(placeholder, text: $text)
            }else{
                TextField(placeholder, text: $text)
            }
        }
        .autocapitalization(.none)
        .padding()
        .font(.title3)
        .foregroundColor(Color(.primary))
        .accentColor(Color(.primary))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
            .stroke(
                Color(.tertiarySystemGroupedBackground),
                lineWidth: 2
            )
        )
        .padding([.leading, .trailing], 40)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomTextField(text: .constant("Hello!"))
    }
}
