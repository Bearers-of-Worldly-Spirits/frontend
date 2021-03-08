//
//  TopMenu.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct TopMenu: View {
    var body: some View {
        
        HStack() {
            Button(action: {
                print("Button was clicked")
            }) {
                Image("hamburger")
            }.padding()
            
            Spacer()
            
            Button(action: {
                print("Button was clicked")
            }) {
                Image("notifs")
            }.padding().padding(.top, 10)
        }//.background(Color.black)
    }
}

struct TopMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopMenu()
    }
}
