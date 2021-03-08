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
                }) { Image("pull_down") }.padding(.vertical, 5)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
                Post().padding(.bottom, 13)
            }.padding(.top, 10).padding(.bottom, 80)
            Spacer()
        }.background(Color.white).cornerRadius(20.0)
    }
}

struct PullDown_Previews: PreviewProvider {
    static var previews: some View {
        PullDown()
    }
}
