//
//  PullUp.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct PullUp: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Button(action: {
                    print("Pull Up public posts")
                }) { Image("pull_up") }
                Spacer().frame(height: 20)
                HStack(spacing: 45) {
                    BottomMenu()
                }.padding(.bottom,  80)
            }.padding(.top, 10)
            Spacer()
        }.background(Color.white).cornerRadius(40.0)
    }
}

struct PullUp_Previews: PreviewProvider {
    static var previews: some View {
        PullUp()
    }
}