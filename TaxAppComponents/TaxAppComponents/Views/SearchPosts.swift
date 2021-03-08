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
            SearchBar().padding(.top, -60).padding(.bottom, 20)
            PullDown().padding(.top, -10)
            BottomMenu().padding(.top, -85)
        }//.background(Color.black)
    }
}

struct SearchPosts_Previews: PreviewProvider {
    static var previews: some View {
        SearchPosts()
    }
}
