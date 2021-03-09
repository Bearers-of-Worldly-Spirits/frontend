//
//  CreateNewPost.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/9/21.
//

import SwiftUI

struct CreateNewPost: View {
    var body: some View {
        VStack {
            TopMenu()
            Profile().padding(.top, -50)
            NewPost()
            BottomMenu().padding(.top, -50)
        }//.background(Color.blue)
    }
}

struct CreateNewPost_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPost()
    }
}
