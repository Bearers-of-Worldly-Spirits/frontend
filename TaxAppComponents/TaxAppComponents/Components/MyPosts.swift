//
//  MyPosts.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct MyPosts: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Button(action: {
                    print("Pull Up public posts")
                }) { Image("pull_down") }.padding(.top, 13)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, -30)
                HStack(spacing: 45) {
                    BottomMenu()
                }.padding(.bottom, 80).padding(.top, 40)
            }.padding(.top, 10)
            Spacer()
        }.background(Color.black).cornerRadius(20.0)
    }
}

struct MyPosts_Previews: PreviewProvider {
    static var previews: some View {
        MyPosts()
    }
}
