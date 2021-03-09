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
                Text("Your open posts:").font(.caption).foregroundColor(Color.gray).padding(.trailing, 170)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
            }.padding(.top, 20).padding(.bottom, 40)
            Spacer()
        }.background(Color.white).cornerRadius(20.0)
    }
}

struct MyPosts_Previews: PreviewProvider {
    static var previews: some View {
        MyPosts()
    }
}
