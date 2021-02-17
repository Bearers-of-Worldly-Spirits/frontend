//
//  NextPrevBar.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI

struct NextPrevBar: View {
    
    var title:String = ""
    var next: () -> ()
    var prev: () -> ()
    
    var body: some View {
        HStack {
            Button("Prev", action: prev)
            .foregroundColor(Color(.tertiaryLabel))
            Spacer()
            Text(title)
            Spacer()
            Button("Next", action: next)
            .foregroundColor(Color("Primary"))
        }
        .padding()
        .font(Font.custom(Theme.fontName, size: 15).weight(.bold))
    }
}

struct NextPrevBar_Previews: PreviewProvider {
    static var previews: some View {
        NextPrevBar {
            
        } prev: {
    
        }
    }
}
