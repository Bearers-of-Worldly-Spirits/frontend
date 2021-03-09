//
//  ProfilePage.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct ViewProfilePage: View {
    var body: some View {
        VStack {
            TopMenu()
            Profile().padding(.top, -50).padding(.bottom, 10)
            MyPosts().padding(.bottom, 30)
            BottomMenu().padding(.top, -70)
        }//.background(Color.blue)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ViewProfilePage()
    }
}
