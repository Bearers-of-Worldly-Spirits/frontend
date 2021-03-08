//
//  BottomMenu.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/5/21.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                print("Search public posts")
            }) { Image("search") }.padding(.trailing, 40).padding(.bottom, 30)
            Button(action: {
                print("Add public post")
            }) { Image("add") }.padding(.trailing, 40).padding(.bottom, 30)
            Button(action: {
                print("Go to Profile")
            }) { Image("profile") }.padding(.bottom, 30)
            Spacer()
        }.background(Color.white)
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu()
    }
}
