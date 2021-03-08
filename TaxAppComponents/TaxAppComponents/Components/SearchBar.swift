//
//  SearchBar.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        VStack {
            Image("user").padding(.bottom, 10)
            Image("search_bar")//.background(Color.black)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
