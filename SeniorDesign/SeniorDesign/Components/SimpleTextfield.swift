//
//  SimpleTextfield.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI

struct SimpleTextfield: View {
        
    @Binding var text:String
    
    var systemImageName:String = "pencil"
    var placeholder:String = "Placeholder"
    var keyboardType:UIKeyboardType = .default
    var secure:Bool = false
    var capitalize:UITextAutocapitalizationType = .none
            
    var body: some View {
        
        HStack {
            Image(systemName: systemImageName)                
            Group {
                if secure {
                    SecureField(placeholder, text: $text)
                }else{
                    TextField(placeholder, text: $text)
                }
            }
            .keyboardType(keyboardType)
            .disableAutocorrection(true)
            .autocapitalization(capitalize)
        }
        .padding()
        .dynamicFont(min: 14, step: 0.5, weight: .medium, design: .rounded)
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
