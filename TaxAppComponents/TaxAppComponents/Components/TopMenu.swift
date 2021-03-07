//
//  TopMenu.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct TopMenu: View {
    var body: some View {
        
        let teal = UIColor(red: 0.0549, green: 0.9137, blue: 0.8902, alpha: 1.0);
        //var username:String = "";
        
        VStack {
            HStack {
                VStack {
                    Button(action: {
                        print("Button was clicked")
                    }) {
                        Image("hamburger")
                            .padding(.all, 10)
                    }
                    Spacer().frame(height: 50)
                }
                
                Image("user")
                    .padding(.top, 40)
                
                Spacer()
                VStack {
                    Button(action: {
                        print("Button was clicked")
                    }) {
                        Image("notifs")
                            .padding(.all, 10)
                    }
                    Spacer().frame(height: 40)
                }
            }
            //Spacer()
            HStack {
                Spacer()
                Image("search_bar")
                    .padding(.all, 10)
            }
        }
        .background(Color.init(teal))
    }
}

struct TopMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopMenu()
    }
}
