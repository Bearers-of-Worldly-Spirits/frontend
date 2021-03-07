//
//  SearchCategories.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct SearchCategories: View {
    var body: some View {
        let teal = UIColor(red: 0.0549, green: 0.9137, blue: 0.8902, alpha: 1.0);
        VStack {
            TopMenu()
            Categories()
            Spacer().frame(height:10)
            BottomMenu()
//Spacer().frame(height:10)
        }.background(Color.init(teal))
    }
}

struct SearchCategories_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategories()
    }
}
