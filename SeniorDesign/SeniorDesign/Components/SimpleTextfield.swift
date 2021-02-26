//
//  SimpleTextfield.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct SimpleTextfield: View {
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
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .padding()
        .font(Font.custom(Theme.fontName, size: 16, relativeTo: .caption).weight(.medium))
        .foregroundColor(Theme.primaryColor)
        .accentColor(Theme.primaryColor)
        .frame(maxWidth: Theme.maxScreenWidth)
    }
}

struct SimpleTextfield_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextfield(text: .constant(""))
    }
}
