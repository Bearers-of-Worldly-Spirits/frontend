//
//  BottomMenu.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/5/21.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
        Button(action: {
            print("Search public posts")
        }) { Image("search") }
        Button(action: {
            print("Add public post")
        }) { Image("add") }
        Button(action: {
            print("Go to Profile")
        }) { Image("profile") }
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu()
    }
}
