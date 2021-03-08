//
//  SearchCategories.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

// possible issues: I had to add 2 Spacer() to remove whitespace from the top and bottom of the screens

struct SearchCategories: View {
    var body: some View {
        // Using temporary  "teal" color throughout app components and views -- need to replace with gradient background
        VStack {
            TopMenu()
            SearchBar().padding(.top, -60).padding(.bottom, 20)
            Categories()
            PullUp()
            BottomMenu().padding(.top, -60)
        }//.background(Color.black)//.padding(.top, 45)
    }
}

struct SearchCategories_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategories()
    }
}
