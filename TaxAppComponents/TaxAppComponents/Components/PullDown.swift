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
                }) { Image("pull_down") }.padding(.bottom, 10)
                //Spacer().frame(height: 20)
                //Post(status: self.status)
                Post().padding(.bottom, 14)
                Post().padding(.bottom, 14)
                Post().padding(.bottom, 14)
                Post().padding(.bottom, -30)
                HStack(spacing: 45) {
                    BottomMenu()
                }.padding(.bottom, 80).padding(.top, 40)
            }.padding(.top, 10)
            Spacer()
        }.background(Color.white).cornerRadius(20.0)
    }
}

struct PullDown_Previews: PreviewProvider {
    static var previews: some View {
        PullDown()
    }
}
