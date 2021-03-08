//
//  SearchPosts.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct SearchPosts: View {
    var body: some View {
        // Using temporary  "teal" color throughout app components and views -- need to replace with gradient background
        
        VStack {
            TopMenu()
            PullDown()
        }.padding(.top, 45)
    }
}

struct SearchPosts_Previews: PreviewProvider {
    static var previews: some View {
        SearchPosts()
    }
}
