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
        VStack {
            Circle().fill(Color.gray).frame(width: 70, height: 70)
            Text("category")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
