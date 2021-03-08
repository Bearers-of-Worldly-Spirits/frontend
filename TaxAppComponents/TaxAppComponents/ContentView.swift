//
//  ContentView.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // code inside here
        //Hstack {}
        //Vstack {}
        //Zstack {}
//        Text("Testing...!")
//            .font(Font.system(.title))
//            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//            .padding()
//        Button("Click me", action : {
//            print("Hello")
//        })
//
        
           HStack{
                Text("Login")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(40.0)
                Text("Join")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(40.0)
            }.overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.green, lineWidth: 1)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
