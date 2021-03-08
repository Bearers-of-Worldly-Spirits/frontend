//
//  ProfilePage.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        VStack {
            TopMenu()
            Profile()
            MyPosts()
            PullDown()
            BottomMenu()
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
