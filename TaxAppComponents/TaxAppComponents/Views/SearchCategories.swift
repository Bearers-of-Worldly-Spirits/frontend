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
            Categories().padding(.bottom, 20)
            PullUp()
        }.padding(.top, 45)
    }
}

struct SearchCategories_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategories()
    }
}
