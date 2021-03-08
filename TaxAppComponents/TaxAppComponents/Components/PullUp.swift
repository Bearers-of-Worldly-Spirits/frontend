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
            Button(action: {
                print("Pull Up public posts")
            }) { Image("pull_up") }.padding()
            Spacer()
        }.padding(.bottom, 50).background(Color.white).cornerRadius(40.0)
    }
}

struct PullUp_Previews: PreviewProvider {
    static var previews: some View {
        PullUp()
    }
}
