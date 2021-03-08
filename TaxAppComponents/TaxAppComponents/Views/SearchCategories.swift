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
        let teal = UIColor(red: 0.0549, green: 0.9137, blue: 0.8902, alpha: 1.0);
        VStack {
            TopMenu()
            Categories()
            BottomMenu()
        }.background(Color.init(teal)).padding(.top, 35)
    }
}

struct SearchCategories_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategories()
    }
}
