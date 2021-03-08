//
//  PullDown.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct PullDown: View {
    var body: some View {
        //var status = "inprogress"
        
        HStack {
            Spacer()
            VStack {
                Button(action: {
                    print("Pull Up public posts")
                }) { Image("pull_down") }
                Spacer().frame(height: 20)
                //Post(status: self.status)
                Post()
                Post()
                Post()
                Post()
                HStack(spacing: 45) {
                    BottomMenu()
                }.padding(.bottom, 100).padding(.top, 20)
            }.padding(.top, 10)
            Spacer()
        }.background(Color.white).cornerRadius(40.0)
    }
}

struct PullDown_Previews: PreviewProvider {
    static var previews: some View {
        PullDown()
    }
}
