//
//  NewPost.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/9/21.
//

import SwiftUI

struct NewPost: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Title:").font(.caption).foregroundColor(Color.gray).padding(.trailing, 225)
                // Replace with text box
                RoundedRectangle(cornerRadius: 5, style: .continuous)     .fill(Color.white)
                    .frame(width: 250, height: 35)
                    .border(Color.gray)
                
                Text("Description:").font(.caption).foregroundColor(Color.gray).padding(.trailing, 185)
                // Replace with text box
                RoundedRectangle(cornerRadius: 5, style: .continuous)     .fill(Color.white)
                    .frame(width: 250, height: 110)
                    .border(Color.gray)
                
            }.padding(.top, 20).padding(.bottom, 100)
            Spacer()
        }.background(Color.white).cornerRadius(20.0)
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}
