//
//  Categories.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct Categories: View {
    var body: some View {
        
        let space_vertical = Spacer().frame(width: 25);
        let space_between = Spacer().frame(width: 45);
        
        VStack {
            HStack {
                space_vertical
                SingleCategory()
                space_between
                SingleCategory()
                space_between
                SingleCategory()
                space_vertical
            }.padding(.all, 10)
            
            HStack {
                space_vertical
                SingleCategory()
                Spacer()
                SingleCategory()
                Spacer()
                SingleCategory()
                space_vertical
            }.padding(.all, 10)
            
            HStack {
                space_vertical
                SingleCategory()
                Spacer()
                SingleCategory()
                Spacer()
                SingleCategory()
                space_vertical
            }.padding(.all, 10)
        }//.background(Color.black)
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
