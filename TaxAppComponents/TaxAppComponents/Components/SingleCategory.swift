//
//  SingleCategory.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct SingleCategory: View {
    var body: some View {
        Button(action: {
            print("Button was clicked")
        }) {
            VStack {
                Circle().fill(Color.white).frame(width: 45, height: 45)
                Text("category").foregroundColor(.white).font(.caption)
            }
        }
    }
}

struct SingleCategory_Previews: PreviewProvider {
    static var previews: some View {
        SingleCategory()
    }
}
